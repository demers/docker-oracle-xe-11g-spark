#!/bin/bash

/usr/sbin/startup.sh 2> /dev/null &
sleep 2
java -jar target/sparkprojets-jar-with-dependencies.jar 2> /dev/null &
sleep 2
/usr/sbin/sshd -D