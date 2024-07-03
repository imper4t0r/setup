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
sudo apt install -y mc wget curl htop micro bat speedtest-cli rsync neofetch ncdu tree lsd

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


neofetch