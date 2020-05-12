#!/bin/bash

# From line 68 in https://github.com/kubernetes/kubernetes/blob/master/test/kubemark/gce/util.sh
lib::interesting::vars_with_prefix()
{
    local FOO_x="foo"
    local FOO_y="bar"
    local FOO_z="alpha"
    # ${!FOO_*} will expand to names of variables beginning with 'FOO'
    for var in ${!FOO_*}; do
      # "${var#FOO_}" will remove 'FOO_' part from 'var'
      cut_var="${var#FOO_}"
      # Needed to expand to the *value* of 'var' I guess
      original_val=${!var}
      local "${cut_var}"="${original_val}"
      echo "Original var name: ${var}, cut variable name: ${cut_var}, value: ${!cut_var}"
    done
}