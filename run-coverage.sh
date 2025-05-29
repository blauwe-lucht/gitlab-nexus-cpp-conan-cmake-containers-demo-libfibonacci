#!/bin/bash

set -euo pipefail

conan build . --build=missing --settings=build_type=Debug
cd build/Debug
gcovr --root=../../.. --exclude='.*test/.*' --cobertura=coverage.xml
