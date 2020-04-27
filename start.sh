#!/bin/bash

/usr/sbin/startup.sh 2> /dev/null &
sleep 2
cd /home/ubuntu
/usr/bin/mvn "package"
chmod ubuntu:ubuntu -R /home/ubuntu/target
java -jar target/sparkprojets-jar-with-dependencies.jar 2> /dev/null &
sleep 2
/usr/sbin/sshd -D