#!/bin/bash

# Condition options http://tiswww.case.edu/php/chet/bash/bash.html#lbBW
# Also 'help test', 'help [', 'help [[' https://stackoverflow.com/questions/11008084/how-to-find-the-options-in-if-conditions-of-shell

lib::conditions::string()
{
    # -n true if string exists and is not empty
    local FOO="bar"
    if [[ -n "$FOO" ]]; then
      echo "Foo exists and is not empty"
    fi

    # -z true if string exists and is of length zero
    local BAR=""
    if [[ -z "$BAR" ]]; then
      echo "Bar is empty"
    fi
}