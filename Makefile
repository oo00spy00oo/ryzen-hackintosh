all: download-latest-release

.PHONY: download-latest-release tools

download-latest: download-latest-kext-release download-latest-oc-release

download-latest-kext-release:
	sh Scripts/dl_latest_release.sh

download-latest-oc-release:
	sh Scripts/dl_latest_oc_release.sh

install-tools:
	git submodule update --init --recursive
	chmod +x Tools/KextExtractor/KextExtractor.command
	chmod +x Tools/MountEFI/MountEFI.command

update-tools:
	git submodule update --init --recursive
	git submodule update --remote --merge

extract-kext:
	./Scripts/extract_kexts.sh