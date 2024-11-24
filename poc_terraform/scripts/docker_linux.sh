#!/bin/bash
# Actualización del sistema e instalación de dependencias
apt update -y && apt upgrade -y

# Configuración del hostname
HOSTNAME="DOCKERSRV"
echo $HOSTNAME > /etc/hostname
hostnamectl set-hostname $HOSTNAME
sed -i "s/$(hostname)/$HOSTNAME/g" /etc/hosts

# Instalación de Docker y Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
bash get-docker.sh
mkdir -p /usr/local/lib/docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 \
    -o /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
docker compose version # Validar instalación exitosa

# Instalación de Git
apt install -y git

# Clonar repositorio y construir imagen personalizada de Jenkins
REPO_URL="https://github.com/andresdocker/dockerandres.git"
git clone $REPO_URL
cd dockerandres || exit 1 # Verificar que el repositorio existe
docker build -t myjenkins-blueocean:2.479.1-1 .

# Despliegue de contenedores usando Docker Compose
docker compose up -d
