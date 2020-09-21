Commands to scan for open sockets:

`netstat --listen` 
`ss -s`
`lsof` // list open files & processes that opened them- including sockets

Files
`/proc/net/tcp` tcp sockets
`/proc/net/udp` udp sockets
`/proc/net/raw ` raw sockets

Connect to socket

`nc -U [SOCKET_PATH}`