# Apache Ignite Docker Image
This repo contains docker image for Apache Ignite using Cloudera CDH with Debian as the platform. 

It installs the data fabric and ignite accelerator (i.e. IGFS). 

There is not an image to pull from Docker right know as this is still a work in progress. 

So, checkout it out from git and run the following Docker commands to get it running: 

## <image name>:<version> are both arbitrary. CD to the working subdirectory containting the Dockerfile. 
'''
docker build -t <image name>:<version>
docker run -it
'''

#for additional shells:
'''docker ps 
docker exec -it <image ID> bash -l

##or
'''
docker exec -it <
'''

## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.


