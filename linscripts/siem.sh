#!/bin/sh

# Aggregate logs from a lot of servers

# Put a list of server IPs or hostnames in the file named 'servers'.
# Put the list of files to watch in 'files.[server name or IP]'.

(for s in $(cat servers)
 do
     for f in $(cat "files.$s")
     do
         (ssh "$s" "tail -f $f" | (while read i
                                       do echo "$f from $s: [$i]"
                                   done)) &
     done
 done) | cat
