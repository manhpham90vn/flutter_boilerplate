.DEFAULT_GOAL := run

.PHONY: clean
clean: cleanFlutterBuild cleanPubCache
cleanFlutterBuild:
	fvm flutter clean
cleanPubCache:	
	fvm flutter pub cache clean -f

.PHONY: run
run: getPub runPub
getPub:
	fvm flutter pub get
runPub:	
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
