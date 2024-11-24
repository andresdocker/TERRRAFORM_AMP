#!/bin/bash
echo "este es un mensaje" > ~/mensaje.txt
hostnamectl set-hostname serverzabbix
systemctl restart systemd-hostnamed