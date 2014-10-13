#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# Collect directory for relative paths
DIR="$(dirname "$BASH_SOURCE[0]")"

# Retrieve the language
# TODO: Figure out why Vagrant's python lacks yaml module
# TODO: Stop using brittle greps
language="$(grep "language" .travis.yml | sed -e "s/language:\\s*//")"
# python - <<EOF
# import yaml
# EOF

# If there is a fix for the language, run it
# e.g. lib/fixes/node.sh exists, run it
language_fix="$DIR/fixes/$language.sh"
if test -x "$language_fix"; then
  "$language_fix"
fi
