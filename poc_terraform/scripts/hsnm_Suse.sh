#!/bin/bash
sudo zypper update -y
echo $NUEVO_HOSTNAME | sudo tee /etc/hostname
sudo hostnamectl set-hostname POC_SUSE
sudo sed -i "s/$(hostname)/$NUEVO_HOSTNAME/g" /etc/hosts


#Install SSM
cd /tmp
mkdir ssm
cd ssm
sudo yum install -y https://s3.us-east-1.amazonaws.com/amazon-ssm-us-east-1/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent