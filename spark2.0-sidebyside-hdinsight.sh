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
sudo rm -r $newspark.tgz
sudo rm -r $newspark
sudo rm -r $SPARK2_DIR
wget "https://www.apache.org/dist/spark/spark-2.0.0/$newspark.tgz"
tar -xvf $newspark.tgz
rm $newspark.tgz
cd "$newspark"
rm -r jars/hadoop* 
#sudo mkdir $SPARK2_DIR 
cd conf
wget "https://raw.githubusercontent.com/AurelienGalicher/installscripts/master/spark-env.sh"
wget "https://raw.githubusercontent.com/AurelienGalicher/installscripts/master/spark-defaults.conf"

sudo mv "/tmp/$newspark" "$SPARK2_DIR"


# Create symlinks
sudo ln -s "$SPARK2_DIR" \
   "/usr/hdp/current/spark-client2"
sudo ln -s "$SPARK2_DIR/yarn/spark-2.0.0-yarn-shuffle.jar" \
   "$HADOOP_DIR/lib/spark-yarn-shuffle.jar"
sudo ln -s $HADOOP_DIR /usr/hdp/current/hadoop
sudo ln -s $HADOOP_YARN_DIR /usr/hdp/current/hadoop-yarn   

echo "Spark 2.0 installation completed"
