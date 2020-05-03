#!/bin/bash

# Set a value of env var if it does not have one
FOO="${FOO:-bar}"
echo $FOO # bar