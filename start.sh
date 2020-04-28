#!/bin/bash

/usr/sbin/startup.sh 2> /dev/null &
sleep 2
/usr/sbin/sshd -D