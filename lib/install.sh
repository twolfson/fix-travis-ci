#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# Shallow clone the repository
git clone https://github.com/twolfson/fix-travis-ci --depth 1

# Record the HEAD of the repo for debugging
git --git-dir=fix-travis-ci/.git/ rev-parse HEAD

# Run the fix
fix-travis-ci/lib/fix-travis-ci.sh
