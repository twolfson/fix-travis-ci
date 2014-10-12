#!/usr/bin/env bash
# Output commands and exit on first failure
set -e
set -x

# Generate assertion statements
assert_equal () {
  actual="$0"
  expected="$1"
  message="$2"
  if test "$actual" != "$expected"; then
    echo "$message" 1>&2
    exit 1
  fi
}
assert_not_equal () {
  actual="$0"
  expected="$1"
  message="$2"
  if test "$actual" == "$expected"; then
    echo "$message" 1>&2
    exit 1
  fi
}

# Save root directory for navigating between fixtures
# (e.g. fix-travis-ci)
root_dir="$PWD"

# In a `node@0.8` environment
n use 0.8.28
cd "$root_dir/test/test-files/node.travis.yml"

  # BEFORE: Save original npm version
  npm_version="$(npm --version)"

  # when `fix-travis-ci` runs
  "$root_dir/lib/fix-travis-ci.sh"

    # it upgrades `npm` to the latest one
    assert_not_equal "$(npm --version)" "$npm_version" '\`fix-travis-ci\` did not upgrade \`npm\` in a \`node@0.8\` environment'

# In a non-node environment
n use 0.10.32
cd "$root_dir/test/test-files/node.travis.yml"

  # Save original npm version
  npm_version="$(npm --version)"

  # when `fix-travis-ci` runs
  ../lib/fix-travis-ci.sh

    # it doesn't touch `npm`
    assert_equal "$(npm --version)" "$npm_version" '\`fix-travis-ci\` upgraded \`npm\` in a non-node environment'
