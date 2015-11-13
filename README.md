# Apache Ignite on CDH
This repo contains a Docker configuration for Apache Ignite using Cloudera CDH with Debian as the platform. 

It installs the data fabric and ignite accelerator (i.e. IGFS). 

Currently, there is not an image to pull from Docker as this is still a work in progress. So, check it out from git and run the following Docker commands to get it running. 

## Build and run it 
CD to working directory with Dockerfile and run `docker build -t <arbitrary name>:<version> .` 

`docker images`

`docker run -it <arbitrary name>:<version>`

`cd /home/ignite_home`

`./run.sh` - this only needs to be run once. 

At this point your are running two independent processes.
ToDo: configure it to integrate and run IGFS based on https://apacheignite.readme.io/docs/installing-on-cloudera-cdh

for additional shells:
`docker ps` 

`docker exec -it <container/image ID> bash -l`

or

`docker exec -it <image ID>`

## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.





