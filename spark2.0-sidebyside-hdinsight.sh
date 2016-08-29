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
rm -r $newspark.tgz
rm -r $newspark
wget "https://www.apache.org/dist/spark/spark-2.0.0/$newspark.tgz"
tar -xvf $newspark.tgz
cd "$newspark"
rm "jars/hadoop*" 
sudo mkdir $SPARK2_DIR 
sudo mv "$newspark" "$SPARK2_DIR"


# Create symlinks
sudo ln -s "$SPARK2_DIR/yarn/spark-2.0.0-yarn-shuffle.jar" \
   "$HADOOP_DIR/lib/spark-yarn-shuffle.jar"
sudo ln -s $HADOOP_DIR /usr/hdp/current/hadoop
sudo ln -s $HADOOP_YARN_DIR /usr/hdp/current/hadoop-yarn   

echo "Spark 2.0 installation completed"
