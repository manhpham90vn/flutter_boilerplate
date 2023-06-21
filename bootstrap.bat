ECHO OFF

ECHO Delete file
del /q /s *.freezed.dart
del /q /s *.g.dart
del /q /s di.config.dart

ECHO Clean cache
fvm flutter clean
fvm flutter pub cache clean -f

ECHO Get data
fvm flutter pub get

ECHO Run build runner
fvm flutter packages pub run build_runner build --delete-conflicting-outputs