#!/bin/bash
yum update -y
echo "nuevo-nombre" | sudo tee /etc/hostname
sudo hostnamectl set-hostname POC_REDHAT
sudo sed -i "s/$(hostname)/nuevo-nombre/g" /etc/hosts

# # Install .NET
# rpm -Uvh https://packages.microsoft.com/config/amazonlinux/2/packages-microsoft-prod.rpm
# yum install -y dotnet-sdk-3.1
 
# # Install Node.js
# curl -sL https://rpm.nodesource.com/setup_14.x | bash -
# yum install -y nodejs
 
#Install SSM
cd /tmp
mkdir ssm
cd ssm
sudo yum install -y https://s3.us-east-1.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent