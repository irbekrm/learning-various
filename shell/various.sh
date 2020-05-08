#!/bin/bash

THE_ROOT="$(dirname "${BASH_SOURCE[0]}")"

source "${THE_ROOT}/lib/bash_variables.sh"

# Set a value of env var if it does not have one
FOO="${FOO:-bar}"
echo $FOO # bar

# BASH_SOURCE vs $0
# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
lib::bash_variables::bash_source