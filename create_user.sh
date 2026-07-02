#!/bin/bash

# This is a simple script to create user on a linux system

#Check if user has root previliges
if [[ $EUID -ne 0  ]]; then
    echo "This script must be run as a root user. Run script as root or use sudo.";
    exit 1;
fi

username=$1;

if [[ -z "$username" ]]; then
    echo "Provide a username as an argument to the script.";
    exit 1;
fi

while getent passwd "$username" &> /dev/null;
do
    echo "User $username already exists. Please provide a different username.";
    read -p "Enter a new username: " username;

    if [[ -z "$username" ]]; then
        echo "Provide a username as an argument to the script.";
        exit 1;
    fi
done


echo "Creating user $username";
sudo useradd -m "$username";
PASSWORD=$(openssl rand -base64 12)

echo "$username:$PASSWORD" | sudo chpasswd;
sudo chage -d 0 "$username"
echo "User $username with password $PASSWORD created successfully.";
