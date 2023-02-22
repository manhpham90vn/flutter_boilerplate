.DEFAULT_GOAL := run

.PHONY: delete
delete: clean cleanPubCache

.PHONY: run
run: getPub runPub

clean:
	fvm flutter clean
runPub:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
getPub:
	fvm flutter pub get	
upgradePub:
	fvm flutter pub upgrade	
cleanPubCache:
	fvm flutter pub cache clean -f
showOutdate:
	fvm flutter pub outdated	