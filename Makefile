SHELL := /bin/bash

.DEFAULT_GOAL := all

.PHONY: all
all: clean run

.PHONY: clean
clean: cleanFlutter cleanCache
cleanFlutter:
	flutter clean
cleanCache:	
	flutter pub cache clean -f

.PHONY: run
run: get buildPackages
get:
	flutter pub get
buildPackages:	
	flutter packages pub run build_runner build --delete-conflicting-outputs
