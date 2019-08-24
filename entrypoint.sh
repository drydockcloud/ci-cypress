#!/bin/bash
set -e

args=( "$@" )

if [ "${TARGET}" != "" ]; then
  export CYPRESS_baseUrl="${TARGET}"
fi

# If the first argument is cypress, then remove it.
if [ "${args[0]}" == "cypress" ]; then
  args=( "${args[@]:1}" )
fi

# Run if Drydock "autotest" command is provided.
if [ "${args[0]}" == "autotest" ]; then
  args[0]="run"
fi

# Re-execute with provided args
exec cypress "${args[@]}"