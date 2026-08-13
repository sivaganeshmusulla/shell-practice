#!bin/bash

USERID=$(id -u)
LoGS_FOLDER="/var/log/shell_script"
LOGS_FILE="/var/log/shell_script/$(date +%Y-%m-%d_%H-%M-%S)_script.log"
if [ $USERID -eq 0 ]; then
    echo "You are running this script as root."
else
    echo "You are not running this script as root." 
    exit 1
fi
mkdir -p $LoGS_FOLDER
dnf install -y nginx

VALIDATE(){
    if [$? -eq 0 ]; then
        echo "Installing package ."
    else
        echo "Pls run the command with root user."
    fi
}
VALIDATE $?