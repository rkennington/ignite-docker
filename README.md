# Apache Ignite on CDH
This repo contains a Docker configuration for Apache Ignite using [Cloudera Hadoop 5.3](http://www.cloudera.com/content/www/en-us/documentation/enterprise/5-3-x/topics/introduction.html) [quickstart](https://github.com/caioquirino/docker-cloudera-quickstart) with Debian as the platform. 

It installs an [Apache Ignite](https://ignite.apache.org/) In-Memory Data Fabric and Hadoop Accelerator (i.e. IGFS). 

Currently, there is not an image to pull from Docker as this is still a work in progress. So, check it out from git and run the following Docker commands to get it running. 


## Build and run it 
CD to working directory with Dockerfile and run `docker build -t <arbitrary name>:<version> .` 

`docker build -t <arbitrary name>:<version> .`

`docker images` - to see what you created

`docker run -it <arbitrary name>:<version>` or `docker run -it <Image ID>` 

or, to run the container in background: `docker run -itd <arbitrary name>:<version>` 


`cd /home/ignite_home`

`./run.sh` - this only needs to be run once. Type Ctrl-Q to exit but keep it running. Otherwise, Ctrl-C to abort it. 

At this point your are running two independent processes.
ToDo: configure it to integrate and run IGFS based on [installing it on cloudera CDH](https://apacheignite.readme.io/docs/installing-on-cloudera-cdh).

for additional shells:

`docker ps` 

`docker exec -it <Container ID> bash -l` or `docker exec -it <Image ID> /bin/bash`

`docker stop <Container ID>` - to stop it.

`docker rmi -f horse:v1` - to remove it permenantly


## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.
