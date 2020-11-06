all: download-latest-release

.PHONY: download-latest-release

download-latest: download-latest-kext-release download-latest-oc-release

download-latest-kext-release:
	sh Scripts/dl_latest_kext_release.sh

download-latest-oc-release:
	sh Scripts/dl_latest_oc_release.sh

kext-extractor:
	./Tools/KextExtractor/KextExtractor.command Kexts/ OC/