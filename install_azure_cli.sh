
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

sudo pip install azure

