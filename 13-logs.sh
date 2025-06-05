#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMETAMP=$(date +%Y-%m-%d-%H-%M)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo -e "$2.... $R Failure"
        exit 1
    else
        echo -e "$2....$G Success"
    fi
}

echo "Script started executing at; $TIMESTAMP" &>>$LOG_FILE_NAME


if [ $USERID -ne 0 ]
then
    echo "ERROR:: YOu must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ] #not installed
then
    echo -e "$Y MySQL not installed"
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already $Y installed"
fi



dnf installed git -y &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then  
    echo -e "Installing Git... $R Failure"
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already...$Y installed"
fi