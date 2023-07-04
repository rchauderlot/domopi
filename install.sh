#!/bin/bash
# Usage: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rchauderlot/domopi/master/install.sh)"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get autoclean
sudo apt-get install docker
sudo apt-get install docker-compose

mkdir .domopi_docker_tmp
cd .domopi_docker_tmp
curl -fsSL https://raw.githubusercontent.com/rchauderlot/domopi/master/docker-compose.yml
#docker-compose up -d
cd ..
# rm -rf .domopi_docker_tmp


# Install a set of a docker containers from a docker-compose.yml stored in a github repository?
# install 3G dongle?
# Install the 3G dongle driver
#sudo apt-get install -y 3g-modem-manager-applet

# Create a new network connection
#nmcli device add type 3g

# Set the APN
#nmcli connection modify 3g apn "your_apn"

# Set the username and password
#nmcli connection modify 3g username "your_username"
#nmcli connection modify 3g password "your_password"

# Enable the network connection
#nmcli connection up 3g

# access point enable?


# iptables install and config

echo "Please, reboot and restore duplicati backup if any"
