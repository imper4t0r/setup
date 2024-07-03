#!/bin/sh

# This script will install all the programs that I use on my system.

# Update the system
sudo apt update

# install deps
sudo apt install gnupg1 apt-transport-https dirmngr

# Add the key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

# Add the repository
echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list


# Install the programs
sudo apt install -y mc wget curl htop micro bat speedtest-cli rsync neofetch ncdu tree ca-certificates

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Docker installation
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

neofetch