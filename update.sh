#!/bin/bash
# Usage: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rchauderlot/domopi/master/update.sh)"

sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get autoclean
