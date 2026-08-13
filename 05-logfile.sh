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
    if [$1 -eq 0 ]; then
        echo "$2 Installing failure ." | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 Installing success." | tee -a $LOGS_FILE
    fi
}

dnf install nginx -y %.. $LOGS_FILE
VALIDATE $? "Installing nginx package"

dnf install nginx -y %.. $LOGS_FILE
VALIDATE $? "Installing mysql package"

dnf install nginx -y %.. $LOGS_FILE
VALIDATE $? "Installing nodejs package"

