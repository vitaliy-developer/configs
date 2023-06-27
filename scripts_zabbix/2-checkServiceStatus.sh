#!/bin/bash 
# Check service status 
statusNginx=$(systemctl status nginx | grep -i 'active (running)' | awk '{print $1, $2, $3}')
statusNginx2=$(systemctl status nginx | grep -i 'Active: inactive (dead)' | awk '{print $1, $2, $3}')

if [[ $statusNginx = 'Active: active (running)' ]]; then
     echo 1, $statusNginx 
     #echo $statusNginx 
     # 1 - true, Active: active (running)
elif [[ $statusNginx2 = 'Active: inactive (dead)' ]]; then
     echo 0, $statusNginx2 
     #echo $statusNginx2 
     # 0 - false, Active: inactive (dead)
fi
