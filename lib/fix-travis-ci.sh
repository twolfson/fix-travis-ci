#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# Retrieve the language
# TODO: Figure out why Vagrant's python lacks yaml module
# TODO: Stop using brittle greps
language="$(grep "language" .travis.yml | sed -e "s/language:\\s*//")"
# python - <<EOF
# import yaml
# EOF

# If there is a fix for the language, run it
# e.g. lib/fixes/node.sh exists, run it
language_fix="fixes/$language.sh"
echo "$language_fix"
echo "$PWD"
if test -x "$language_fix"; then
  "$language_fix"
fi
