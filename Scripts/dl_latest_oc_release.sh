#!/bin/bash

set -e -u

githubRepos=(
    "acidanthera/OpenCorePkg"
)

cd OC

for githubRepo in ${githubRepos[@]}; do
    echo "\n"
    echo "Downloading ${githubRepo}..."

    curl -s https://api.github.com/repos/${githubRepo}/releases/latest \
    | grep "RELEASE" \
    | grep "browser_download_url.*zip" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

    echo "Downloaded ${githubRepo}!"
done