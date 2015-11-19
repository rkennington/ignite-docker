# Apache Ignite on CDH
This repo contains a Docker configuration for Apache Ignite using [Cloudera Hadoop 5.3](http://www.cloudera.com/content/www/en-us/documentation/enterprise/5-3-x/topics/introduction.html) with Ubuntu as the platform and is based on [quickstart](https://github.com/caioquirino/docker-cloudera-quickstart) to integrate IGFS.

It installs an [Apache Ignite](https://ignite.apache.org/) In-Memory Data Fabric and Hadoop Accelerator (i.e. IGFS) and attemps to integrate IGFS with Hadoop 2.6.0.

Currently, there is not an image to pull from Docker as this is still a work in progress. So, check it out from git and run the following Docker commands to get it running. 


# Current Goals of this project: 

*Goal*: to observe Ignite/IGFS performance with and without IGFS using a stream of Pig commands against delimited files. This platform will serve as the base configuration to develop IGFS clients. Actuall performance will be done on another system. 

1) Configure Hadoop to integrate with IGFS based on [installing it on cloudera CDH](https://apacheignite.readme.io/docs/installing-on-cloudera-cdh). 

2) [Setup IGFS as a Hadoop file system](https://apacheignite.readme.io/docs/file-system) to support file operations against Hadoop. Determine CLI commands to verify it is working with [basic file operations](https://apacheignite.readme.io/v1.0/docs/igfs) (i.e. mkdir, cp, ls, del, etc.) as well as load some comma delimited files to work with.

2) Startup one or more Ignite clients to use as a resource on the platform.

3) Develop an Ignite client that distributes and executes a stream of Pig commands. Continue to use the Docker platform as a development environment to experiment with. 

4) Migrate to a distributed cluster to observe performance. 

5) Explore other aspects of Ignite use cases. 


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

`docker rmi -f <arbitrary name>:v1` - to remove the image permanently.


#Steps to setup IGFS 

Resolved by following recommendations in [this thread](http://apache-ignite-users.70518.x6.nabble.com/IllegalArgumentException-Invalid-URI-for-NameNode-address-check-fs-defaultFS-igfs-igfs-localhost-is--td1978.html#a2009).
`
`$IGNITE_HOME=/home/ignite_home/ignite/apache-ignite-hadoop-1.4.0-bin` - According to the instructions in ​$IGNITE_HOME/config/hadoop/core-site.ignite.xml, we should be able to run $IGNITE_HOME/bin/setup-hadoop.sh to setup IGFS to use HDFS locally.

`./cdh_stop_hdfs.sh` - to shutdown hdfs as igfs will superceded it in PRIMARY mode. 
 
`./run.sh` - to download and install Ignite.
 
`./execute.sh &` - to start up Ignite as an independent thread. Ignite must be running to use haddop-ignite CLI file operations. 

Not try some IGFS file commands with `hadoop-ignite`:

`./hadoop-ignited fs -help`

`./hadoop-ignited fs -mkdir /temp`

`fs -put cdh_stop_script.sh /temp/cdh_stop_script.sh` - to copy a local file to IGFS

`./hadoop-ignited fs -ls /temp`


## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.
.
