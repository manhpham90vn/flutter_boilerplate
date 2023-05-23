.DEFAULT_GOAL := bootstrap

.PHONY: install
install: clean cleanPubCache getPub deleteGenerate runPub

.PHONY: bootstrap
bootstrap: getPub deleteGenerate runPub

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
deleteGenerate:
	rm -rf *.freezed.dart
	rm -rf *.g.dart
	rm -rf di.config.dart
runUnitTest:
	fvm flutter test test/unit_test
runWidgetTest:
	fvm flutter test test/widget_test