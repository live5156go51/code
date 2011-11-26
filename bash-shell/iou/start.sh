#! /bin/bash
export NETIO_NETMAP=./NETMAP
/home/fedora/cisco/iou/wrapper-linux -m /home/fedora/cisco/iou/i86bi_linux-adventerprisek9-ms -p  2001 -- -e 2 -s 1 1 &
sleep 2
/home/fedora/cisco/iou/wrapper-linux -m /home/fedora/cisco/iou/i86bi_linux-adventerprisek9-ms -p  2002 -- -e 2 -s 1 2 &
sleep 2
/home/fedora/cisco/iou/wrapper-linux -m /home/fedora/cisco/iou/i86bi_linuxl2-upk9-ms -p 3001 -- -e 2 -s 1 3 &
sleep 2
/home/fedora/cisco/iou/wrapper-linux -m /home/fedora/cisco/iou/i86bi_linuxl2-upk9-ms -p 3002 -- -e 2 -s 1 4 &
unset NETIO_NETMAP
echo 'start done! '
