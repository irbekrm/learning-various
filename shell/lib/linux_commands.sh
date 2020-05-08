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