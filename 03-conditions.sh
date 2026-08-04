#!bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ]; then
    echo "You are running this script as root."
else
    echo "You are not running this script as root." 
    exit 1
fi

dnf install -y nginx


if [$? -eq 0 ]; then
    echo "Installing package ."
else
    echo "Pls run the command with root user."
fi