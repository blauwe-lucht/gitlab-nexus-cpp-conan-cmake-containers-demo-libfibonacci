#!/bin/bash

set -xeuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

conan build . --build=missing --settings=build_type=Debug

cd build/Debug

common_args='--root ../.. --exclude '.*test/.*' --exclude-unreachable-branches'

# This is needed to get coverage for merge requests:
gcovr ${common_args} --xml-pretty  --cobertura=coverage.xml

# This is needed to be able to view a nice coverage report:
gcovr ${common_args} --html-nested=coverage.html --html-self-contained

# We also need the output to stdout so GitLab can pick up the overall coverage percentage:
gcovr ${common_args}
