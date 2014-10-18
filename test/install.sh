#!/usr/bin/env bash
# Output commands and exit on first failure
set -e
set -x

# Update apt-get once
if ! test -f .updated_apt_get; then
  apt-get update
  touch .updated_apt_get
fi

# Install `node` for testing
if ! which node > /dev/null; then
  apt-get install -y python-software-properties python g++ make
  add-apt-repository -y ppa:chris-lea/node.js
  apt-get update
  apt-get install -y nodejs
fi

# Install `n`, `node@0.8`, and `node@0.10`
if ! which n > /dev/null; then
  npm install -g n
  n 0.8.28
  n 0.10.32
fi
