#!/bin/bash

set -e -u

PWD_OLD=$(pwd)

cd Tools/KextExtractor/
./KextExtractor.command ${PWD_OLD}/Kexts /