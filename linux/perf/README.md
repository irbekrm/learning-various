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
- `vmstat -w [interval[count]]`
- `r`- number of processes waiting for CPU -> saturation
- `si`/`so` - swap-ins, swap-outs -> whether the server is out of memory
- `free` - the amount of free memory
- `us`, `sys` - user space time, system space time as a percentage of the total CPU time. Whether the load is application level or kernel level
- `wa` - time spent waiting for disk I/O as a percentage of the total CPU time -> can point at disk bottleneck
- memory swap-out - when there's no longer free space in physical memory and kernel writes some of the data in memory to disk
- memory swap-in - when previously swapped out data is needed by a process, so kernel needs to write it to memory again
- large number of swap-in/swap-out operations can affect performance
- how aggressively the kernel swaps out memory (i.e writes to disk pages belonging to idle processes) can be configured
- user space time- time CPU spends doing work in user space
- system space time - time CPU spends doing work in system (kernel space)
- CPU saturation- how many processes are _waiting_ for to be executed by the CPU

#### `mpstat`
- `mpstat -P ALL [interval[count]]` show the usage (similar metrics as for `vmstat`) of each CPU
- if one CPU is over-used it might mean that a single application (single-threaded?) is consuming a lot of resources

#### `pidstat`
- `pidstat -p PID [interval[count]]` monitor CPU usage of a specific task
- `pidstat INTERVAL` seems to continuously show most resource-consuming tasks on the system. Useful to see patterns
- %CPU column shows the percentage of compute power from all CPUs being used so can be more than 100% (each has max 100%)

## Useful
`dd if=/dev/urandom of=500MBfile bs=1M count=500` - generate some CPU load (from https://www.thomas-krenn.com/en/wiki/Linux_Performance_Measurements_using_vmstat)

## Resources
- Netflix blog post on Linux Performance Analysis https://netflixtechblog.com/linux-performance-analysis-in-60-000-milliseconds-accc10403c55
- Brendan Gregg on Linux load average http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html
- Brendan Gregg USE method http://www.brendangregg.com/usemethod.html
- Some useful `dmesg` options https://www.howtoforge.com/linux-dmesg-command/
- [Kernel ring buffer](https://unix.stackexchange.com/questions/198178/what-are-the-concepts-of-kernel-ring-buffer-user-level-log-level)
- [memory swap-in/out](https://scoutapm.com/blog/understanding-page-faults-and-memory-swap-in-outs-when-should-you-worry#:~:text=The%20process%20of%20writing%20pages,This%20is%20swapping%2Din.)
- [real, user and sys time](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1)
- [vmstat](https://www.thomas-krenn.com/en/wiki/Linux_Performance_Measurements_using_vmstat)
- [mpstat manpage](https://linux.die.net/man/1/mpstat)
- [pidstat manpage](https://linux.die.net/man/1/pidstat)