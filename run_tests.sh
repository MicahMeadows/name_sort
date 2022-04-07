#!/bin/bash

echo "Running tests for normal sorting...";
dart test test/string_sorting/normal_sorting_test.dart -r expanded
echo

echo "Running tests for reverse sorting...";
dart test test/string_sorting/reverse_sorting_test.dart -r expanded
echo

echo "Running tests for file input repository...";
dart test test/file_input/file_name_repository_test.dart -r expanded
echo

