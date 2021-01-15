
# This directive tells make to include Makefile.vars
include Makefile.vars

# By default this rule will be executed first- 'first' is the default target
first: $(filename)
# recipe line *must* start with a tab character
	cat $(filename)

# This rule will be executed as a pre-requisite of 'first'
$(filename):
# $$n to specify that this is shell variable, not make variable
# recipes are passed to shell line by line-
# to pass the for-loop as a whole '\' is used
	for n in $(names); do \
	 echo $$n; \
	done
	echo $(names) > $(filename)

# declare 'clean' as a phony target to explicitly tell make to not look
# for a file named 'clean'
.PHONY: clean
# This rule will only be executed when called explicitly with 'make clean'
clean:
	rm -f $(filename)