#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -euo pipefail

LATEST_PANDOC_VERSION=$(curl -sL https://pandoc.org/releases.html | grep -o 'pandoc-[0-9]\+\.[0-9]\+\.[0-9]\+' | awk -F'-' '{print $2}' | head -n 1)
PANDOC_CACHE_FOLDER="${HOME}/.pandoc-cache"
PANDOC_FILE_NAME="pandoc-${LATEST_PANDOC_VERSION}-x86_64-macOS.pkg"
PANDOC_URL_GITHUB="https://github.com/jgm/pandoc/releases/download/${LATEST_PANDOC_VERSION}/${PANDOC_FILE_NAME}"

INPUT_PATH="readme.md"
OUTPUT_PATH="output.pdf"

while getopts ":i:o:v:" opt; do
    case $opt in
    i)
        INPUT_PATH="$OPTARG"
        ;;
    o)
        OUTPUT_PATH="$OPTARG"
        ;;
    v)
        LATEST_PANDOC_VERSION="$OPTARG"
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
    esac
done

if [ -z "$INPUT_PATH" ] || [ -z "$OUTPUT_PATH" ]; then
    echo "Error: Input and output paths must be specified."
    exit 1
fi

if [ -z "$LATEST_PANDOC_VERSION" ]; then
    echo "Failed to manage version."
    exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
    mkdir -p "$PANDOC_CACHE_FOLDER"
    wget -P "${PANDOC_CACHE_FOLDER}/" "$PANDOC_URL_GITHUB"

    cd "$PANDOC_CACHE_FOLDER" && sudo installer -pkg "$PANDOC_FILE_NAME" -target /

    pandoc --version

    pandoc "${INPUT_PATH}" -o "${OUTPUT_PATH}"

    rm -rf "${PANDOC_CACHE_FOLDER}"
else
    pandoc "${INPUT_PATH}" -o "${OUTPUT_PATH}"
    echo "Pandoc converted has been executed succesfully!"
    echo "You could find out the converted file in ${OUTPUT_PATH}"
fi
