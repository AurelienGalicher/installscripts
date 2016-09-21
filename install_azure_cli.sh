
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install azure-cli -g

sudo apt-get -y install zsh
touch ~/.zshrc
echo "#" >>  ~/.zshrc
echo "export SPARK_HOME=/usr/hdp/current/spark-client2" >> ~/.zshrc
echo "export PATH=/usr/hdp/current/spark-client2/bin:$PATH" >> ~/.zshrc
echo '. <(azure --completion)' >> .zshrc
echo "export AZURE_STORAGE_ACCOUNT=<storage_account_name>" >> ~/.zshrc
echo "export AZURE_STORAGE_ACCESS_KEY=<storage_account_key>" >> ~/.zshrc

wget https://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh
bash Anaconda3-4.1.1-Linux-x86_64.sh -b
echo "export PATH=/home/srvadmin/anaconda3/bin:$PATH" >> ~/.zshrc
export PATH=/home/srvadmin/anaconda3/bin:$PATH
#conda install azure -b
conda install -c conda-forge azure-storage=0.32.0
#sudo pip install azure
#sudo pip install redis


