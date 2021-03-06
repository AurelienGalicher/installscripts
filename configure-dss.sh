#! /bin/bash -e
# Configures DSS on an HDInsight edge node
# Assumes that the 'srvadmin' user already exists, with a home directory


# Settings
DSS_VER="3.1.4"
DSS_DIR="/mnt/srvadmin"
DSS_INS="/home/srvadmin"
DSS_PORT="20000"


echo "*********************************************"
echo "*           Dataiku DSS installer           *"
echo "*********************************************"

# Locale - may not be necessary?
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Global update of the system
gpg --keyserver pgp.mit.edu --recv-keys B9733A7A07513CAD
gpg -a --export 07513CAD | apt-key add -
apt-get -y update
apt-get -y upgrade

# Preparing the DSS Data directory
mkdir -p $DSS_DIR
chown srvadmin:srvadmin $DSS_DIR

# Downloading and setting-up DSS
mkdir -p $DSS_INS/installers
mkdir -p $DSS_INS/installers/dataiku
chown -R srvadmin:srvadmin $DSS_INS

sudo -u srvadmin sh -c "
  wget http://downloads.dataiku.com/public/studio/$DSS_VER/dataiku-dss-$DSS_VER.tar.gz -P $DSS_INS/installers/dataiku
  cd $DSS_INS/installers/dataiku
  tar -xzf dataiku-dss-$DSS_VER.tar.gz
  rm dataiku-dss-$DSS_VER.tar.gz
"

$DSS_INS/installers/dataiku/dataiku-dss-$DSS_VER/scripts/install/install-deps.sh -yes -without-java -with-r

sudo -u srvadmin sh -c "$DSS_INS/installers/dataiku/dataiku-dss-$DSS_VER/installer.sh -p $DSS_PORT -d $DSS_DIR/dss-data-dir"

# Preparing HDFS
sudo -u hdfs sh -c "
  hdfs dfs -mkdir /user/srvadmin
  hdfs dfs -mkdir /user/srvadmin/dss_managed_datasets
  hdfs dfs -chown srvadmin /user/srvadmin
  hdfs dfs -chown srvadmin /user/srvadmin/dss_managed_datasets
"

# Configuring & starting DSS / full features
sudo -u srvadmin sh -c "
  $DSS_DIR/dss-data-dir/bin/dssadmin install-hadoop-integration
  $DSS_DIR/dss-data-dir/bin/dssadmin install-spark-integration
  $DSS_DIR/dss-data-dir/bin/dssadmin install-h2o-integration
  $DSS_DIR/dss-data-dir/bin/dssadmin install-R-integration
  $DSS_DIR/dss-data-dir/bin/dss start
"
