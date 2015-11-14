#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_40

echo "Stop Zookeeper"
service zookeeper-server stop

echo "Stop HDFS"
bash -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x stop ; done'

echo "Stop Yarn"
service hadoop-yarn-resourcemanager stop
service hadoop-yarn-nodemanager stop
#chmod -R 777 /var/log/hadoop-mapreduce
service hadoop-mapreduce-historyserver stop

echo "Stop Oozie"
export OOZIE_URL=http://localhost:11000/oozie
service oozie stop

echo "Stop Spark"
service spark-worker stop
service spark-master stop

echo "We can't stop Kafka, try 'kill -9 <process id>'"
KAFKA_HOME=/home/kafka
sudo -u kafka nohup ${KAFKA_HOME}/kafka/bin/kafka-server-stop.sh
#sudo -u kafka nohup ${KAFKA_HOME}/kafka/bin/kafka-server-start.sh ${KAFKA_HOME}/kafka/config/server.properties > ${KAFKA_HOME}/kafka/kafka.log 2>&1 &

echo "Stop Components"
service hue stop

service solr-server stop

echo "We won't stop hiveserver2"
#nohup hiveserver2 &

bash -c 'for x in `cd /etc/init.d ; ls impala-*` ; do sudo service $x stop ; done'

service hbase-master stop
service hbase-regionserver stop
service hbase-thrift stop

echo "Start KMS"
service hadoop-kms-server stop

echo "You will need to restart this machine after you configure the ignite hadoop accelerator has been installed. "

