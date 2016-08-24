#!/bin/bash

sudo -s apt-get update && sudo apt-get install software-properties-common --yes && sudo add-apt-repository ppa:openjdk-r/ppa --yes && sudo apt-get update && sudo apt-get install openjdk-8-jre --yes

echo "java openjdk 8 installation completed"
