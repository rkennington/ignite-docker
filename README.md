# Apache Ignite Docker Image
This repo contains a Docker configuration for Apache Ignite using Cloudera CDH with Debian as the platform. 

It installs the data fabric and ignite accelerator (i.e. IGFS). 

Currently, there is not an image to pull from Docker as this is still a work in progress. So, check it out from git and run the following Docker commands to get it running. 

## CD to the working subdirectory containting the Dockerfile. 
`docker build -t <arbitrary name>:<version> .`

`docker images`

`docker run -it <arbitrary name>:<version>`

#for additional shells:
`docker ps` 
`docker exec -it <container/image ID> bash -l`

##or
`docker exec -it <image ID>`

## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.





