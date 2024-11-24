#!/bin/bash
echo "nuevo-nombre" | sudo tee /etc/hostname
sudo hostnamectl set-hostname poc_awslinux
sudo sed -i "s/$(hostname)/nuevo-nombre/g" /etc/hosts
sudo reboot