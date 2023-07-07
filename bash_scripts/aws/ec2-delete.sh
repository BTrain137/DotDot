#! /bin/bash
read -p "Please Choose Server's InstanceId: " instanceId
echo "Deleting EC2 InstanceId: $instanceId";

aws ec2 stop-instances --instance-ids $instanceId
aws ec2 terminate-instances --instance-ids $instanceId





