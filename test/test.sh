#!/usr/bin/env bash
# Output commands and exit on first failure
set -e
set -x

# In a `node@0.8` environment
n use 0.8.28

  # Save original npm version
  npm_node_0_8_28_version="$(npm --version)"

  # when `fix-travis-ci` runs
  ../lib/fix-travis-ci.sh

    # it upgrades `npm` to the latest one
    test "$(npm --version)" != "$npm_node_0_8_28_version" || echo '`is_on_git`; $? != 0 in git directory' 1>&2
