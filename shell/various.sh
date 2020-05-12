#!/bin/bash

set -u

THE_ROOT="$(dirname "${BASH_SOURCE[0]}")"

source "${THE_ROOT}/lib/bash_variables.sh"
source "${THE_ROOT}/lib/linux_commands.sh"
source "${THE_ROOT}/lib/useful.sh"
source "${THE_ROOT}/lib/variables.sh"
source "${THE_ROOT}/lib/redirection.sh"
source "${THE_ROOT}/lib/source1.sh"
source "${THE_ROOT}/lib/source2.sh"
source "${THE_ROOT}/lib/conditions.sh"
source "${THE_ROOT}/lib/interesting.sh"

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

# Write to stdout/stderr
# &2 Standard Error
# &1 Standard Output
echo "REDIRECTION"
lib::redirection::stdout_stderr

# If two functions with the same name are defined in two
# different files that are sourced,
# the last one sourced will override the other one(s)
# lib::source2::hello overrides lib::source1::hello
hello

# [[ -z ]] [[ -n ]]
lib::conditions::string


lib::interesting::vars_with_prefix