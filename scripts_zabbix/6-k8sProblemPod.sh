#!/bin/bash
# Check k8s pods status 
# Example: --namespace (kibana), pod (kibana)
namespace="web-app"
podName="web-app"

statusPod=$(kubectl get  pods --namespace $namespace | grep -i $podName | awk '{print $3}')

for pod in $statusPod
do
	if [ $pod != 'Running' ]
	then
		echo "PROBLEM: $pod" 
	else
		echo "OK: $pod"
	fi
done

