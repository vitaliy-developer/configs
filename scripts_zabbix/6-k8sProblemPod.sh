#!/bin/bash
# Check k8s pods status 
# Example: --namespace (kibana), pod (kibana)
namespace="web-app"
podName="web-app"

statusPod=$(kubectl get  pods --namespace $namespace | grep -i $podName | awk '{print $3}')

# Problems pod
for problem in $statusPod
do
	if [ $problem != 'Running' ]
	then
		echo "PROBLEM: $problem" 
	fi
done

# Works pod
#for works in $statusPod
#do
#        if [ $works = 'Running' ]
#        then
#		 echo "OK: $works"
#        fi
#done

