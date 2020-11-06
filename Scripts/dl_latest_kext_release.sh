#!/bin/bash

set -e -u

githubRepos=(
    "acidanthera/AppleALC"
    "acidanthera/BrightnessKeys"
    "acidanthera/IntelMausi"
    "acidanthera/Lilu"
    "acidanthera/AirportBrcmFixup"
    "acidanthera/HibernationFixup"
    "acidanthera/CPUFriend"
    "acidanthera/NVMeFix"
    "acidanthera/BrcmPatchRAM"
    "acidanthera/RTCMemoryFixup"
    "acidanthera/VirtualSMC"
    "acidanthera/WhateverGreen"
)

cd Kexts

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