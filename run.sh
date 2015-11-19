#!/bin/bash
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
if [ -z $SKIP_BUILD_LIBS ]; then
  ./build_users_libs.sh

  PROJ_VER=$(mvn -f user-repo/pom.xml dependency:list | grep ':ignite-core:jar:.*:' | \
    sed -rn 's/.*([0-9]+\.[0-9]+\.[0-9]+).*/\1/p')

  if [ ! -z $PROJ_VER ]; then
    IGNITE_VERSION=$PROJ_VER
  fi
fi

if [ -z $SKIP_DOWNLOAD ]; then
  IGNITE_VERSION=$IGNITE_VERSION ./download_ignite.sh

  if [ ! -z $LICENCE_URL ]; then
    wget -O ignite/*/gridgain-license.xml $LICENCE_URL
  fi
fi

# Not needed per https://issues.apache.org/jira/browse/IGNITE-483
#ln -s ${IGNITE_HOME}/libs/ignite-core-1.4.0.jar /usr/lib/hadoop/lib/ignite-core-1.4.0.jar
#ln -s ${IGNITE_HOME}/libs/ignite-hadoop/hadoop/ignite-hadoop-1.4.0.jar /usr/lib/hadoop/lib/ignite-hadoop-1.4.0.jar

mkdir -p $IGNITE_HOME/ignite-conf
cp $IGNITE_HOME/config/hadoop/core-site.ignite.xml $IGNITE_HOME/ignite-conf/core-site.xml
cp $IGNITE_HOME/config/hadoop/hive-site.ignite.xml $IGNITE_HOME/ignite-conf/hive-site.xml
cp $IGNITE_HOME/config/hadoop/mapred-site.ignite.xml $IGNITE_HOME/ignite-conf/mapred-site.xml

echo "Try running ./hadoop-ignite file system commands. Example: './hadoop-ignited fs -mkdir /temp' or './hadoop-ignited fs -ls /'
echo " . "
echo "Startup an ignite node by running ./execute.sh"

# Temporarily disabled to experiment with IGFS and/or Ignite setup.
#./execute.sh


