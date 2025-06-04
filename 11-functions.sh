#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo "$2....Failure"
        exit 1
    else
        echo "$2....Success"
    fi
}



if [ $USERID -ne 0 ]
then
    echo "ERROR:: YOu must have sudo access to execute this script"
fi

dnf list installed mysql

if [$? ne 0] #not installed
then
    echo "MySQL not installed"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi



dnf install git -y

if [ $? -ne 0 ]
then  
    echo "Installing Git...Failure"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Installing Git...Success"
fi