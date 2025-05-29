#!/bin/bash

set -euo pipefail

conan build . --build=missing --settings=build_type=Debug
cd build/Debug

# This is needed to get coverage from merge requests:
gcovr --root=../.. --exclude='.*test/.*' --cobertura=coverage.xml

# This is needed to be able to view a nice coverage report:
gcovr --root=../.. --exclude='.*test/.*' --html=coverage.html

# We also need the output to stdout so GitLab can pick up the overall coverage percentage:
gcovr --root=../.. --exclude='.*test/.*'
