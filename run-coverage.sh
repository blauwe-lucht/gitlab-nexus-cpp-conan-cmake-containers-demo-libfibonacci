#!/bin/bash

set -euo pipefail

conan build . --build=missing --settings=build_type=Debug
cd build/Debug
gcovr --root=../../.. --exclude='.*test/.*' --cobertura=coverage.xml

# We also need the output to stdout so GitLab can pick up the overall coverage percentage.
gcovr --root=../../.. --exclude='.*test/.*'
