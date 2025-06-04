#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"


VALIDATE(){
if [ $1 -ne 0 ]
    then
        echo -e "$2.... $R Failure"
        exit 1
    else
        echo -e "$2....$G Success"
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
    echo -e "MySQL is already $Y installed"
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