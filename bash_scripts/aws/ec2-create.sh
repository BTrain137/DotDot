#! /bin/bash
read -p "Please Choose Server Name: " serverName
echo "Createing EC2 : $serverName";


GROUPID=$(aws ec2 create-security-group --group-name $serverName --description "created sg group")



GROUPID="${GROUPID#*\{}"  # remove everything through the first '{'
GROUPID="${GROUPID%\}*}"  # remove everything starting with the last '}'
GROUPID="${GROUPID#*:}"   # take everything after the ':'
GROUPID="${GROUPID//\"/}" # Remove Quotes

echo $GROUPID

PORTACCESS=$(aws ec2 authorize-security-group-ingress --group-name $serverName --protocol tcp --port 22 --cidr 0.0.0.0/0)

echo $PORTACCESS
PEMKEYS=$(aws ec2 create-key-pair --key-name $serverName --query 'KeyMaterial' --output text > $serverName.pem)

chmod 400 $serverName.pem 

InstanceID=$(aws ec2 run-instances --image-id ami-068663a3c619dd892 --security-group-ids $GROUPID --instance-type t2.micro --key-name $serverName --query 'Instances[0].InstanceId')

InstanceID="${InstanceID#*\[}"
InstanceID="${InstanceID%\]}"
InstanceID="${InstanceID//\"/}" # Remove Quotes
echo $InstanceID

IPADDRESS=$(aws ec2 describe-instances --instance-ids $InstanceID --query 'Reservations[0].Instances[0].PublicIpAddress')

IPADDRESS="${IPADDRESS//\"/}"
echo $IPADDRESS
echo ssh -i $serverName.pem ubuntu@$IPADDRESS
echo "ssh -i $serverName.pem ubuntu@$IPADDRESS" > $serverName-readMe.md;

# Update instance
ssh -i $serverName.pem ubuntu@$IPADDRESS 'sudo apt-get update && sudo apt-get upgrade'

ssh -i $serverName.pem ubuntu@$IPADDRESS
