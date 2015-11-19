#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start from a Debian image.
#FROM debian:8
FROM caioquirino/docker-cloudera-quickstart:latest

# Install tools.
RUN apt-get update && apt-get install -y --fix-missing \
  wget \
  dstat \
  maven \
  git

########## START disabling jdk1.7 install ##########
# Install Oracle JDK.
#RUN mkdir /opt/jdk

##### ToDo: we may not need to add this JDK #####
#RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#  http://download.oracle.com/otn-pub/java/jdk/7u76-b13/jdk-7u76-linux-x64.tar.gz

#RUN tar -zxf jdk-7u76-linux-x64.tar.gz -C /opt/jdk

#RUN rm jdk-7u76-linux-x64.tar.gz

#RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_76/bin/java 100

#RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_76/bin/javac 100

# Sets evironment variables.
#ENV JAVA_HOME /opt/jdk/jdk1.7.0_76/
########## END disabling jdk1.7 install ##########

ENV JAVA_HOME=/usr/lib/jvm/jdk1.8.0_40

# Additional setup of Ignite with CDH. See https://apacheignite.readme.io/docs/installing-on-cloudera-cdh
#ENV IGNITE_HOME /home/ignite_home/ignite/gridgain-community-fabric-1.4.0
ENV IGNITE_HOME /home/ignite_home/ignite/apache-ignite-hadoop-1.4.0-bin

# Create working directory
RUN mkdir /home/ignite_home

WORKDIR /home/ignite_home

# Copy sh files and set permission
ADD *.sh ./
RUN chmod +x *.sh

ADD hadoop-ignited ./
RUN chmod +x hadoop-ignited

#CMD ./run.sh

