# Pandoc Installation and Conversion Script

<p align="center">
    <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT">
    </a>
    <a href="https://savelife.in.ua/en/">
  <img src="https://img.shields.io/badge/ComeBackAlive-%E2%9D%A4-ff69b4.svg" alt="ComeBackAlive">
</a>
</p>

<!-- https://img.shields.io/badge/License-MIT-yellow.svg -->

This Bash script automates the installation of Pandoc on macOS and provides a simple way to convert a Markdown file to a PDF using Pandoc.

## Usage

```bash
bash main.sh [-i INPUT_PATH] [-o OUTPUT_PATH] [-v PANDOC_VERSION]
```

## Options

- `-i INPUT_PATH`: Specify the input Markdown file path. Default is "readme.md".
- `-o OUTPUT_PATH`: Specify the output PDF file path. Default is "output.pdf".
- `-v PANDOC_VERSION`: Specify the Pandoc version to install. Default is the latest version available on the official Pandoc GitHub releases page.

## Installation

The script checks if Pandoc is already installed. If not, it automatically downloads and installs the specified version.

## Example Usage

```bash
# Convert custom_file.md to custom_output.pdf using Pandoc version 2.14.0
bash main.sh -i custom_file.md -o custom_output.pdf -v 2.14.0
```

## Notes

- If Pandoc is already installed, the script will use the existing installation.
- The Pandoc package is downloaded and cached in the user's home directory.

## Dependencies

- `wget` is required for downloading the Pandoc package.
- Internet connectivity is required for version retrieval and package download.

## License

This script is provided under the MIT License. Feel free to modify and distribute it as needed.
