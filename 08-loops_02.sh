#!bin/bash

USERID=$(id -u)
LoGS_FOLDER="/var/log/shell_script"
LOGS_FILE="/var/log/shell_script/$(date +%Y-%m-%d_%H-%M-%S)_script.log"

mkdir -p $LoGS_FOLDER
apt install -y nginx

VALIDATE(){
    if [$1 -eq 0 ]; then
        echo "$2 Installing failure ." | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 Installing success." | tee -a $LOGS_FILE
    fi
}

for package in $@
do
apt install $package -y %.. $LOGS_FILE
VALIDATE $? "Installing $package package"

done

validate $? mysql nodejs nginx