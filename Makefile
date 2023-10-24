all:
	$(MAKE) pub-get-all
	$(MAKE) generate-code-all
	$(MAKE) run

dependencies:
	flutter pub get

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

watch-runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

analyze:
	flutter analyze

run-test:
	@for module in domain data presentation; do \
		$(MAKE) -C $$module run-test; \
	done

clean-all:
	@find . -name pubspec.yaml -exec echo "### Cleaning {}" \; \
	-execdir flutter clean \;

pub-get-all:
	@find . -name pubspec.yaml -exec echo "### Getting packages for {}" \; \
	-execdir flutter pub get \;

generate-code-all:
	@find . -name pubspec.yaml -exec echo "### Generating sources for {}" \; \
	-execdir flutter pub run build_runner build --delete-conflicting-outputs \;

run:
	$(MAKE) analyze
	flutter run --target lib/main.dart