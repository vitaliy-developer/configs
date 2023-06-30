#!/bin/bash
# Check k8s pods status 
# Example: --namespace (kibana), pod (kibana)
namespace="web-app"
podName="web-app"
statusRunning=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'Running' | sed '1!d' | awk '{print $3}')
statusTerminated=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'Terminating' | sed '1!d' | awk '{print $3}')
statusWaiting=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'Waiting' | sed '1!d' | awk '{print $3}')
statusPending=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'Pending' | sed '1!d' | awk '{print $3}')
statusFailed=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'Failed' | sed '1!d' | awk '{print $3}')
statusImagePullBackOff=$(kubectl get  pods --namespace $namespace | grep -i $podName | grep -i 'ImagePullBackOff' | sed '1!d' | awk '{print $3}')

if [[ $statusRunning = 'Running' ]]; then
     echo $statusRunning

elif [[ $statusTerminated = 'Terminating' ]]; then
     echo $statusTerminated

elif [[ $statusWaiting = 'Waiting' ]]; then
     echo $statusWaiting

elif [[ $statusPending = 'Pending' ]]; then
     echo $statusPending

elif [[ $statusFailed = 'Failed' ]]; then
     echo $statusFailed

elif [[ $statusImagePullBackOff = 'ImagePullBackOff' ]]; then
     echo $statusImagePullBackOff

fi
