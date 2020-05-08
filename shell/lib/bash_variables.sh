#!/bin/bash

lib::bash_variables::bash_source() {
  echo "BASH_SOURCE is an array: ${BASH_SOURCE[@]}"
  echo "\$BASH_SOURCE[0] vs \$0 in a sourced function:"
  echo "\$BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
  echo "\$0: ${0}"
}