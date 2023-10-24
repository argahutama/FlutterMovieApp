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

clean_all:
	@find . -name pubspec.yaml -exec echo "### Cleaning {}" \; \
	-execdir flutter clean \;

pub-get-all:
	@find . -name pubspec.yaml -exec echo "### Getting packages for {}" \; \
	-execdir flutter pub get \;

generate-code-all:
	@find . -name pubspec.yaml -exec echo "### Generating sources for {}" \; \
	-execdir flutter pub run build_runner build --delete-conflicting-outputs \;

feature:
	flutter create --template=package $(NAME)
	cp analysis_options.yaml features/$(NAME)
	cp common/Makefile features/$(NAME)
	cd $(NAME)
	rm $(NAME)/{README.md,CHANGELOG.md,LICENSE}
	cd $(NAME) && make dependencies
	echo 'library $(NAME);' > $(NAME)/lib/$(NAME).dart
	echo 'void main() {}' > $(NAME)/test/$(NAME)_test.dart
	git add $(NAME)

run:
	$(MAKE) analyze
	flutter run --target lib/main.dart