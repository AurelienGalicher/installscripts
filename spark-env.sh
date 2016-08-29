#!/usr/bin/env bash

export SPARK_CONF_DIR=${SPARK_CONF_DIR:-/usr/hdp/current/spark-client2/conf}
export HADOOP_HOME=${HADOOP_HOME:-/usr/hdp/current/hadoop-client}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/usr/hdp/current/hadoop-client/conf}
export SPARK_DIST_CLASSPATH=$SPARK_DIST_CLASSPATH:/usr/hdp/current/spark-client2/jars/datanucleus-api-jdo-3.2.6.jar:/usr/hdp/current/spark-client2/jars/datanucleus-rdbms-3.2.9.jar:/usr/hdp/current/spark-client2/jars/datanucleus-core-3.2.10.jar:/etc/hadoop/conf/:/usr/hdp/current/hadoop-client/hadoop-azure.jar:/usr/hdp/current/hadoop-client/lib/azure-storage-2.2.0.jar:/usr/hdp/current/hadoop/client/slf4j-log4j12.jar:/usr/hdp/current/hadoop/client/slf4j-api.jar:/usr/hdp/current/hadoop/hadoop-common.jar:/usr/hdp/current/hadoop/hadoop-azure.jar:/usr/hdp/current/hadoop/client/log4j.jar:/usr/hdp/current/hadoop/client/commons-configuration-1.6.jar:/usr/hdp/current/hadoop/lib/*:/usr/hdp/current/hadoop/client/*:/usr/hdp/current/spark-client2/conf/:/usr/hdp/current/hadoop-yarn/hadoop-yarn-server-web-proxy.jar:/usr/hdp/current/spark-client2/jars/spark-yarn_2.11-2.0.0.jar:/usr/hdp/current/spark-client2/jars/*
