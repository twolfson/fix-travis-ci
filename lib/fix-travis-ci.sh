#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# Determine if we are in `node@0.8`
# TODO: Figure out why Vagrant's python lacks yaml module
# TODO: Stop using brittle greps
language="$(grep "language" .travis.yml | sed -e "s/language:\\s*//")"
echo $language
# python - <<EOF
# # Load in dependencies
# import yaml

# # Start our script
# print 'hello world'
# EOF

# TODO: Find `language`, look for `lib/fixes/{{language}}.sh`
#   If it exists, run it. Inside of `lib/fixes/node.sh`, implement `npm` adjustments
