dependencies:
	flutter pub get

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

watch-runner:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

run-test:
	flutter test --coverage
	lcov --remove coverage/lcov.info -o coverage/lcov.info
	genhtml --ignore-errors empty coverage/lcov.info -o coverage/html
	open coverage/html/index.html