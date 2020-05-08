#!/bin/bash

set -u

THE_ROOT="$(dirname "${BASH_SOURCE[0]}")"

source "${THE_ROOT}/lib/bash_variables.sh"
source "${THE_ROOT}/lib/linux_commands.sh"
source "${THE_ROOT}/lib/useful.sh"
source "${THE_ROOT}/lib/variables.sh"

# BASH_SOURCE vs $0
# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
lib::bash_variables::bash_source

# readlink command prints the actual filename of a symbolic link
echo "Testing readlink command..."
lib::linux_commands::readlink

# tr command for text transformation
echo "Transform text with 'tr'..."
lib::linux_commands::tr

# Random id
echo "Generate 6 random alphanumeric character sequence:"
lib::useful::random

# Setting variables if unset/null
lib::variables::unsetornull
