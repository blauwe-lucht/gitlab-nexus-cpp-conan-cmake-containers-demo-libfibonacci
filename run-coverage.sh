#!/bin/bash

set -euo pipefail

conan build . --build=missing --settings=build_type=Debug
cd build/Debug

# This is needed to get coverage from merge requests:
gcovr --root ../.. --xml-pretty --exclude='.*test/.*' --exclude-unreachable-branches --print-summary --cobertura=coverage.xml

# This is needed to be able to view a nice coverage report:
gcovr --root ../.. --exclude='.*test/.*' --exclude-unreachable-branches --html-nested=coverage.html --html-self-contained
