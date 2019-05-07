#!/bin/bash 

git add .


echo "Enter your commmit message"
read msg


git commit -m "$msg"
