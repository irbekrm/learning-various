#!/bin/bash

lib::redirection::stdout_stderr()
{
    mkdir test_outputs
    write_lines >> test_outputs/stdout 2>> test_outputs/stderr
    echo "Written to stderr:"
    cat test_outputs/stderr
    echo "Written to stdout:"
    cat test_outputs/stdout
    rm -rf test_outputs
}

write_lines()
{
    # Redirect to stderr
    echo '"Hello, error" >&2' >&2
    echo "Hello, error" >&2

    # Write to stdout (default)
    echo 'echo "Hello, stdout"'
    echo "Hello, stdout"
}
