#!/bin/bash

lib::linux_commands::readlink()
{
    echo "Creating a new temporary directory 'foo'.."
    mkdir foo
    echo "Creating a link to 'foo' named 'bar'.."
    ln -s foo bar
    echo "Output of 'readlink bar': $(readlink bar)"
    echo "Cleanup.."
    rm -rf foo bar
}

lib::linux_commands::tr()
{
    # Transform uppercase characters to lowercase
    echo 'echo "AnnaMinnaMarija" | tr A-Z a-z'
    echo "# Output: $(echo "AnnaMinnaMarija" | tr A-Z a-z)"
    # Transform all characters that are not 'a' to 'x'
    echo 'echo annaminnamarija | tr -c a x'
    echo "# Output: $(echo annaminnamarija | tr -c a x)"
    # Delete all numeric characters
    echo 'echo onetwothree123 | tr -d 0-9'
    echo "# Output: $(echo onetwothree123 | tr -d 0-9)"
    # Delete all characters that are not numeric
    echo 'echo ID is 4389348989 | tr -dc 0-9'
    echo "# Output: $(echo ID is 4389348989 | tr -dc 0-9)"
}