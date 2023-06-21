.DEFAULT_GOAL := bootstrap

.PHONY: bootstrap
bootstrap: delete clean get run

clean:
	fvm flutter clean
	fvm flutter pub cache clean -f
get:
	fvm flutter pub get
run:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
upgrade:
	fvm flutter pub upgrade
delete:
	rm -rf *.freezed.dart
	rm -rf *.g.dart
	rm -rf di.config.dart
unit:
	fvm flutter test test/unit_test
ui:
	fvm flutter test test/widget_test