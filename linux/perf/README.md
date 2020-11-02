# Linux Performance

## Notes from https://netflixtechblog.com/linux-performance-analysis-in-60-000-milliseconds-accc10403c55 with some extra explanation for myself

** Tools to quickly manually check Linux server performance **

#### `uptime`
- shows time, since when the system is up, number of logged-in users and system load over last 1, 5 and 15 minutes
- useful to quickly view if load is increasing/decreasing (compare 1, 5, 15 minutes)
- acceptable system load may vary, most useful to compare against known acceptable load
- on Linux this shows _system load_ not CPU load [see Brendan Gregg article](http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html)- so it means that the numbers for 1, 5, 15 minutes isn't directly comparable to the number of threads because it also includes I/O(?needs clarification)
- in a Docker container uptime will show since when the host is up, not the container
- from `sysstat` package

#### `dmesg`
- shows messages from kernel ring buffer (`dmesg` command can also be used to control kernel ring buffer, i.e clear it)
- `dmesg --level=err,warn`, `dmesg -u`, `dmesg | tail` etc
- kernel ring buffer- where kernel messages are stored (so that boottime messages are available to syslog)
- ring buffer- a data structure that is always the same size (older messages get deleted)

#### `vmstat`
- memory swap-out - when there's no longer free space in physical memory and kernel writes some of the data in memory to disk
- memory swap-in - when previously swapped out data is needed by a process, so kernel needs to write it to memory again
- user space time- time CPU spends doing work in user space
- system space time - time CPU spends doing work in system (kernel space)




## Resources
- Netflix blog post on Linux Performance Analysis https://netflixtechblog.com/linux-performance-analysis-in-60-000-milliseconds-accc10403c55
- Brendan Gregg on Linux load average http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html
- Brendan Gregg USE method http://www.brendangregg.com/usemethod.html
- Some useful `dmesg` options https://www.howtoforge.com/linux-dmesg-command/
- [Kernel ring buffer](https://unix.stackexchange.com/questions/198178/what-are-the-concepts-of-kernel-ring-buffer-user-level-log-level)
- [memory swap-in/out](https://scoutapm.com/blog/understanding-page-faults-and-memory-swap-in-outs-when-should-you-worry#:~:text=The%20process%20of%20writing%20pages,This%20is%20swapping%2Din.)
- [real, user and sys time](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1)