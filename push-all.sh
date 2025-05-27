#!/bin/bash

set -euo pipefail

echo Pushing commits to GitHub...
git push

echo Pushing tags to GitHub...
git push --tags

echo Pushing commits to GitLab...
git push gitlab

echo Pushing tags to GitLab...
git push gitlab --tags
