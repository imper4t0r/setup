#!/bin/bash

# Function to create a new user
create_user() {
    username=$1
    password=$2

    # Create the user with the specified username
    sudo useradd -m -s /bin/bash $username

    # Set the user's password
    echo "$username:$password" | sudo chpasswd

    echo "User '$username' has been created with the password '$password'"
}

# Update the system
sudo apt update -y
sudo apt upgrade -y


create_user "alter" "Test231@!"

sudo bash ./programs.sh

