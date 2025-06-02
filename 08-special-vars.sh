#!/bin/bash

echo "All variables passed: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Present working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in background: $!"

sleep 60    # to run in foreground
sleep 60 &  # to run in background