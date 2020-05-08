#!/bin/bash

lib::redirection::stdout_stderr()
{
    mkdir test_outputs
    # 2> redirects stderr
    write_lines > test_outputs/stdout 2> test_outputs/stderr
    echo "Contents of a file where stderr was redirected:"
    cat test_outputs/stderr
    echo "Contents of a file where stdout was redirected:"
    cat test_outputs/stdout
    # Redirect both stdout and stderr (&> only works in bash)
    write_lines &> test_outputs/stdout_and_stderr
    echo "Contents of a file where both stdout and stderr were redirected"
    cat test_outputs/stdout_and_stderr
    rm -rf test_outputs
}

write_lines()
{
    # Redirect to stderr (&2)
    echo '"Hello, error" >&2' >&2
    echo "Hello, error" >&2

    # Write to stdout (&1, also default)
    echo 'echo "Hello, stdout" >&1'
    echo "Hello, stdout" >&1
}
