# TYPES OF VARIABLES

# 1. Recursively expanded
foo = bar
# x is a recursively expanded variable. Cannot do x = $(x)-somestring as it will
# run into an infinite loop.
x = $(foo)
foo = baz 

view_x: # the value of x will be 'baz'
	echo $(x) 

# 2. Simply expanded
foo_again = stuff
# y is a simply expanded variable. Value will be the value as it was at the time
# of definition.
y := $(foo_again)
y := $(y).sh # this would not be possible with a recursively expanded variable
foo_again = other_stuff

view_y: # the value of y will be 'stuff.sh'
	echo $(y)


# Setting value if undefined. Env vars become make variables. 

# Setting MY_FLAG to an empty string if it's undefined. In theory there is
# no need to do this as it looks like make will not error if undefined variable
# is referenced- it would evaluate to an empty string anyway.
MY_FLAG ?=
# Set MY_OTHER_FLAG to some_value if it's undefined.
MY_OTHER_FLAG ?=  some_value

view_my_flag:
	echo $(MY_FLAG) $(MY_OTHER_FLAG)