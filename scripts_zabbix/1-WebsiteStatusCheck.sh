#!/bin/bash
# Check status http://web-site-prod.com
statusWeb=$(curl -Is http://web-site-prod.com | head -1 | awk '{print $2}')
#echo $statusWeb

if [[ $statusWeb = 200 ]]; then
     echo 1 # 1 - true, Website available
elif [[ $statusWeb != 200 ]]; then
     echo 0 # 0 - false, Website not available
fi
