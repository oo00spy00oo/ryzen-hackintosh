#!/bin/bash

set -e -u

githubOC="acidanthera/OpenCorePkg"

cd OC

echo "\n"
echo "Downloading ${githubOC}..."

curl -s https://api.github.com/repos/${githubOC}/releases/latest \
| grep "RELEASE" \
| grep "browser_download_url.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

echo "Downloaded ${githubOC}!"