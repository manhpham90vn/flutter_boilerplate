.DEFAULT_GOAL := bootstrap

.PHONY: bootstrap
bootstrap: clean cleanPubCache getPub runPub

clean:
	fvm flutter clean
cleanPubCache:
	fvm flutter pub cache clean -f
getPub:
	fvm flutter pub get
runPub:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
upgradePub:
	fvm flutter pub upgrade
showOutdate:
	fvm flutter pub outdated