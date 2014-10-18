#!/usr/bin/env bash
# Exit on first failure
set -e

# If we aren't in a Vagrant or Travis CI environment, complain and leave
if test "$VAGRANT" != "true" && test "$TRAVIS" != "true"; then
  echo "Tests must be run in enclosed environment (e.g. Vagrant, Travis) to prevent accidental publishes" 1>&2
  exit 1
fi

# Generate assertion statements
assert_equal () {
  actual="$1"
  expected="$2"
  message="$3"
  if test "$actual" != "$expected"; then
    echo "$message" 1>&2
    exit 1
  fi
}
assert_not_equal () {
  actual="$1"
  expected="$2"
  message="$3"
  if test "$actual" == "$expected"; then
    echo "$message" 1>&2
    exit 1
  fi
}

# Save root directory for navigating between fixtures
# (e.g. fix-travis-ci)
root_dir="$PWD"

# In a `node@0.8` environment
sudo n 0.8.28
cd "$root_dir/test/test-files/node_js.travis.yml"

  # BEFORE: Save original npm version
  npm_version="$(npm --version)"

  # when `fix-travis-ci` runs
  sudo "$root_dir/lib/fix-travis-ci.sh"

    # it upgrades `npm` to the latest one
    assert_not_equal "$(npm --version)" "$npm_version" '`fix-travis-ci` did not upgrade `npm` in a `node@0.8` environment'

# In a non-node environment
sudo n 0.10.32
cd "$root_dir/test/test-files/bash.travis.yml"

  # Save original npm version
  npm_version="$(npm --version)"

  # when `fix-travis-ci` runs
  sudo "$root_dir/lib/fix-travis-ci.sh"

    # it doesn't touch `npm`
    assert_equal "$(npm --version)" "$npm_version" '`fix-travis-ci` upgraded `npm` in a non-node environment'
