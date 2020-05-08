lib::variables::unsetornull()
{
    # Set a value of a variable var if it is not set or is empty
    echo ":- will set variable if it is unset or empty"
    echo 'FOO="" && FOO="${FOO:-bar}" && echo "${FOO}"'
    FOO="" && FOO="${FOO:-bar}" && echo "${FOO}"

    # Set a value of variable if it is not set
    echo "- will set variable if it is unset"
    echo 'FOO="" && "${FOO-bar}" && echo "${FOO}"'
    FOO="" && FOO=${FOO-bar} && echo "${FOO}"
    echo '${BAR-bar} && echo "${BAR}"'
    BAR=${BAR-bar} && echo "${BAR}"
}