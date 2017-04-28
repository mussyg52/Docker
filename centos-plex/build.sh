#!/bin/bash

#Vars

PVTIP=52.52.53.2

#Build updated image
docker build ../centos-plex/

#Give it a name
docker tag $(docker images | awk NR==2{'print $3'}) centos-plex

#Ask if user wants to start the container, The echo is to create a new line
while true; do
	read -p "Would you like to run the container now? $(echo $'\n> ')" yn; 
	case $yn in
		[Yy]* ) docker run --privileged --net newnet --ip $PVTIP -it $(docker images | awk NR==2{'print $3'}); break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done	
