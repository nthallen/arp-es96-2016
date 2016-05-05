#! /bin/sh
srvr() { $1 -V 2>/dev/null & waitfor /dev/huarp/none/cmd/server 3 || { echo $1 failed >&2; return 1; }; }; srvr ./HClsrvr && echo srvr was OK
tmcalgo -V "`./HClsrvr -R`" HCl.tma

