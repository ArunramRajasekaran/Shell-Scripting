#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: YOu must have sudo access to execute this script"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installing MySQL....Failure"
    exit 1
else
    echo "Installing MySQL....Success"
fi


dnf install git -y

if [ $? -ne 0 ]
then  
    echo "Installing Git...Failure"
    exit 1
else
    echo "Installing Git...Success"
fi