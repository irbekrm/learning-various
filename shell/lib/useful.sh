lib::useful::random()
{
    # Generate a random sequence (6 alphanumeric chars)
    # Borrowed from https://github.com/kubernetes/kubernetes/blob/master/test/kubemark/start-kubemark.sh
    head /dev/urandom | LC_ALL=C tr -dc 'a-z0-9' | fold -w 6 | head -n 1
    # LC_ALL=C is needed on OS X
    # head /dev/urandom - first 10 lines from pseudorandom number generator
    # tr -dc 'a-z0-9' - delete all chars that are not alphanumeric
    # fold -w 6 - wrap lines to the length of 6
    # head -n 1 - pick the first line
}