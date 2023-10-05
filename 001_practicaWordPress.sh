#!/bin/bash

echo "Installing multipass"
sudo apt update
sudo apt install -y multipass

echo "available images"
multipass find

echo "https://multipass.run/docs/multipass-cli-commands"
echo "https://multipass.run/docs/create-an-instance"
echo "https://www.conventionalcommits.org/en/v1.0.0/"



echo "launch wordpress instance"
multipass launch jammy --name wordpress --cpus 1 --disk 10G --memory 2G --network en0 --network name=bridge0,mode=manual

echo "Wordpress instance info"
multipass info wordpress

echo "launch mysql instance"
multipass launch jammy --name mysql --cpus 1 --disk 10G --memory 2G --network en0 --network name=bridge0,mode=manual

echo "mysql instance info"
multipass info mysql


echo "Wordpress ip route"
multipass exec wordpress -- ip route
