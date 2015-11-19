#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_40

echo "Stop HDFS"
bash -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x stop ; done'


