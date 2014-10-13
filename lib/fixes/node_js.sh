#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# If we are on an early version of `npm`, upgrade to the latest 1.x.x
# DEV: `caret` notation is supported by `1.4.3` but `npm` didn't start using it until 2.x.x
npm_version="$(npm --version)"
if echo "$npm_version" | grep "^[01]\." > /dev/null; then
  # TODO: Need to be connected to internet for this to work =(
  npm install npm@1.x.x --global
fi

# Upgrade to latest `npm`
npm install npm@latest --global
# TODO: We might need to output version
