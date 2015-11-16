# Apache Ignite on CDH
This repo contains a Docker configuration for Apache Ignite using [Cloudera Hadoop 5.3](http://www.cloudera.com/content/www/en-us/documentation/enterprise/5-3-x/topics/introduction.html) [quickstart](https://github.com/caioquirino/docker-cloudera-quickstart) with Debian as the platform. 

It installs an [Apache Ignite](https://ignite.apache.org/) In-Memory Data Fabric and Hadoop Accelerator (i.e. IGFS). 

Currently, there is not an image to pull from Docker as this is still a work in progress. So, check it out from git and run the following Docker commands to get it running. 


# Current Goals of this project: 
1) Configure Hadoop to integrate with IGFS based on [installing it on cloudera CDH](https://apacheignite.readme.io/docs/installing-on-cloudera-cdh).

2) Develop an Ignite client to use it as a resource. 

3) Observe performance with and without IGFS. 



## Build and run it 
CD to working directory with Dockerfile and run `docker build -t <arbitrary name>:<version> .` 

`docker build -t <arbitrary name>:<version> .`

`docker images` - to see what you created

`docker run -it <arbitrary name>:<version>` or `docker run -it <Image ID>` 

or, to run the container in background: `docker run -itd <arbitrary name>:<version>` 


`cd /home/ignite_home`

`./run.sh` - this only needs to be run once. Type Ctrl-Q to exit but keep it running. Otherwise, Ctrl-C to abort it. 

for commands:

`docker ps` 

`docker exec -it <Container ID> bash -l` or `docker exec -it <Image ID> /bin/bash`

`docker stop <Container ID>` - to stop it.

`docker rmi -f horse:v1` - to remove it permenantly

#Interim steps to setup IGFS - WARNING: still a work in progress

This is a work in progress as I continue to troubleshoot why hadoop is not starting up after I run an IGFS setup script.

`$IGNITE_HOME=/home/ignite_home/ignite/apache-ignite-hadoop-1.4.0-bin` - According to the instructions in ​$IGNITE_HOME/config/hadoop/core-site.ignite.xml, we should be able to run $IGNITE_HOME/bin/setup-hadoop.sh to setup IGFS to use HDFS locally.

`./cdh_stop_script.sh` - to shutdown hadoop and all services as we wills start it all up again. 
 
`ps -ef` to get a list of processes that were not stopped 

`kill -9 <kafka pid>` - to kill the Kafka process and it's startup script
 
`$IGNITE_HOME/bin/setup-hadoop.sh` - answered 'y' to all questions to setup IGFS to use HDFS locally. 

`/usr/bin/cdh_startup_script.sh` - observe console and logs to see hadoop failing to start. 






## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.
