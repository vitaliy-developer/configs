#!/bin/bash 
# Check docker container status (IMAGE: vitaliy1303/web-app:latest) 

statusContainer=$(docker ps | grep -i 'vitaliy1303/web-app:latest' | awk '{print $7}')
statusContainer2=$(docker ps | grep -i 'vitaliy1303/web-app:latest' | awk '{print $7}')

if [[ $statusContainer = 'Up' ]]; then
     echo 1, $statusContainer 
     # 1 - true, Up
elif [[ $statusContainer2 = '' ]]; then
     echo 0, Down 
     # 0 - false, Down
fi
