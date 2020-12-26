#!/bin/bash

set -e -u

githubRepos=(
    "acidanthera/VirtualSMC"
    "acidanthera/AppleALC"
    "acidanthera/WhateverGreen"
    "acidanthera/HibernationFixup"
    "acidanthera/BrightnessKeys"
    "acidanthera/AirportBrcmFixup"
    "acidanthera/Lilu"
    "acidanthera/RTCMemoryFixup"
    "acidanthera/CPUFriend"
    "acidanthera/NVMeFix"
    "acidanthera/BrcmPatchRAM"
    "acidanthera/IntelMausi"
)

cd Kexts

for githubRepo in ${githubRepos[@]}; do
    echo "\n"
    echo "Downloading ${githubRepo}..."

    FILE_NAME=$(curl https://api.github.com/repos/${githubRepo}/releases/latest | jq -r '.assets[1].name')

    if [ -f "$FILE_NAME" ]; then
        echo "$FILE_NAME exists!!!"
    else
         curl -s https://api.github.com/repos/${githubRepo}/releases/latest \
        | grep "RELEASE" \
        | grep "browser_download_url.*zip" \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | wget -qi -

        echo "Downloaded ${githubRepo}: $FILE_NAME"
    fi

done