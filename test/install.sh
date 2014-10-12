#!/usr/bin/env bash
# Output commands and exit on first failure
set -e
set -x

# Update apt-get once
if ! test -f .updated_apt_get; then
  sudo apt-get update
  touch .updated_apt_get
fi

# Install `node` for testing
if ! which node > /dev/null; then
  sudo apt-get install -y python-software-properties python g++ make
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs
fi

# Install `n` and `node@0.8`
if ! which n > /dev/null; then
  sudo npm install -g n
  n 0.8.28
fi
