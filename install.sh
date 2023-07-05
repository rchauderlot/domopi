#!/bin/bash
# Usage: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rchauderlot/domopi/master/install.sh)"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get autoclean
sudo apt-get -y install docker
sudo apt-get -y install docker-compose

# install all the docker images
curl -fsSL https://raw.githubusercontent.com/rchauderlot/domopi/master/docker-compose.yml | docker-compose -f /dev/stdin up  | 

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


# iptables install and config to open 28357 port?
# Install iptables
#sudo apt-get install iptables

# Create a new rule to allow traffic on port 28357
#sudo iptables -A INPUT -p tcp --dport 28357 -j ACCEPT

# Save the iptables rules
#sudo iptables-save

echo
echo "Please, reboot and restore duplicati backup if any"
