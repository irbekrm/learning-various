#!/bin/bash

# Local variables have block scope
x="outer"
foo () {
    local x="inner"
    echo "Inner 'x' = ${x}"
}

echo "Outer 'x' = ${x}"
foo