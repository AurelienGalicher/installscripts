#!/bin/bash

newspark="spark-2.0.0-bin-hadoop2.7"

SPARK_DIR="$(readlink -f "/usr/hdp/current/spark-client")"
SPARK_CONF_DIR="$(readlink -f "/usr/hdp/current/spark-client/conf")"
CURRENT_DIR=${SPARK_DIR%/spark}
HADOOP_DIR="$CURRENT_DIR/hadoop"
HADOOP_YARN_DIR="$CURRENT_DIR/hadoop-yarn"
SPARK2_DIR="$CURRENT_DIR/spark-client2"

## Download & Install Binary
cd "/tmp"
#sudo rm -r $newspark.tgz
#sudo rm -r $newspark
sudo rm -r $SPARK2_DIR
sudo unlink "$HADOOP_DIR/lib/spark-yarn-shuffle.jar"
sudo unlink  /usr/hdp/current/hadoop
sudo unlink  /usr/hdp/current/hadoop-yarn   

