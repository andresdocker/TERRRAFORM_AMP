#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
echo "nuevo-nombre" | sudo tee /etc/hostname
sudo hostnamectl set-hostname SRV_JKS
sudo sed -i "s/$(hostname)/nuevo-nombre/g" /etc/hosts

# Instalar Java (OpenJDK 11)
sudo apt install -y openjdk-11-jdk

# Añadir la clave y el repositorio de Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Actualizar el índice de paquetes nuevamente
sudo apt update

# Instalar Jenkins
sudo apt install -y jenkins

# Iniciar y habilitar el servicio de Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Confirmar el estado del servicio de Jenkins
# sudo systemctl status jenkins

# echo "Jenkins y Java se han instalado correctamente."
# echo "Para completar la configuración de Jenkins, visita http://<tu_ip_publica>:8080 en tu navegador."
# echo "El archivo de contraseña inicial de Jenkins está en /var/lib/jenkins/secrets/initialAdminPassword"

EOF