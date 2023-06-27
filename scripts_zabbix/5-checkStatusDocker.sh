#!/bin/bash 
# Check service status "Docker"
statusService=$(systemctl status docker | grep -i 'active (running)' | awk '{print $1, $2, $3}')
statusService2=$(systemctl status docker | grep -i 'Active: inactive (dead)' | awk '{print $1, $2, $3}')

if [[ $statusService = 'Active: active (running)' ]]; then
     echo 1, $statusService 
     #echo $statusService
     # 1 - true, Active: active (running)
elif [[ $statusService2 = 'Active: inactive (dead)' ]]; then
     echo 0, $statusService2 
     #echo $statusService2 
     # 0 - false, Active: inactive (dead)
fi

