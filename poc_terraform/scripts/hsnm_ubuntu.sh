#!/bin/bash
# Actualización e instalación de dependencias
sudo apt update -y
sudo apt upgrade -y
# sudo apt install -y openssh-server ufw

# Configuración de hostname
echo "nuevo-nombre" | sudo tee /etc/hostname
sudo hostnamectl set-hostname DOCKERSRV
sudo sed -i "s/$(hostname)/nuevo-nombre/g" /etc/hosts

# Instalación de Docker y Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Obtener imagenes del repositorio de git
sudo apt install git
git clone https://github.com/andresdocker/dockerandres.git
# crear imagenen de jenkins
cd dockerandres
sudo docker build -t myjenkins-blueocean:2.479.1-1 .
# desplegar contenedores 
sudo docker compose up -d


# Obtener imagenes del repositorio de git
# Permitir SSH
# sudo ufw allow ssh

# # Crear backups de los archivos originales antes de reemplazarlos
# if [ -f /home/ubuntu/Dockerfile ]; then
#     mv /home/ubuntu/Dockerfile /home/ubuntu/Dockerfile.bak
# fi

# if [ -f /home/ubuntu/docker-compose.yaml ]; then
#     mv /home/ubuntu/docker-compose.yaml /home/ubuntu/docker-compose.yaml.bak
# fi

# # Descargar archivos de configuración desde S3 y reemplazar los originales
# aws s3 cp s3://buckettestdocker/Dockerfile /home/ubuntu/Dockerfile
# aws s3 cp s3://buckettestdocker/docker-compose.yaml /home/ubuntu/docker-compose.yaml

# # Moverse al directorio y ejecutar Docker Compose
# cd /home/ubuntu
# sudo docker-compose up -d
