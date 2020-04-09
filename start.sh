#!/bin/bash

/etc/init.d/mongodb restart
/usr/sbin/startup.sh 2> /dev/null &
java -jar target/sparkprojets-jar-with-dependencies.jar 2> /dev/null &
/usr/sbin/sshd -D