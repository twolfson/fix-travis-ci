#!/usr/bin/env bash
# Echo outputs and exit on first error
set -e
set -x

# Determine if we are in `node@0.8`
# TODO: Start testing via Vagrant so we don't affect the host environment
# TODO: Figure out why Vagrant
# TODO:
# python - <<EOF
# # Load in dependencies
# import yaml

# # Start our script
# print 'hello world'
# EOF

# TODO: Find `language`, look for `lib/fixes/{{language}}.sh`
#   If it exists, run it. Inside of `lib/fixes/node.sh`, implement `npm` adjustments
