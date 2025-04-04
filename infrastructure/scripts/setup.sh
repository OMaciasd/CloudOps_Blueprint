#!/bin/bash

set -e  # Detener ejecución si ocurre un error
set -o pipefail

echo "🚀 Iniciando configuración completa del entorno..."

# Actualizar e instalar herramientas básicas
echo "📦 Actualizando paquetes..."
sudo apt-get update -y && sudo apt-get upgrade -y

echo "🔧 Instalando herramientas esenciales (curl, git, unzip)..."
sudo apt-get install -y curl git unzip apt-transport-https ca-certificates gnupg software-properties-common lsb-release

# Instalar Node.js LTS (v14)
echo "🟢 Instalando Node.js 14.x..."
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar Docker
echo "🐳 Instalando Docker..."
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo usermod -aG docker "$USER"

# Instalar Docker Compose (si no está incluido)
if ! command -v docker-compose &>/dev/null; then
    echo "🐙 Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Instalar Terraform
echo "🏗️ Instalando Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/hashicorp.gpg
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y && sudo apt-get install -y terraform

# Instalar Ansible
echo "📦 Instalando Ansible..."
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Instalar kubectl
echo "☸️ Instalando kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Verificaciones
echo "📋 Verificando versiones:"
echo "Node.js: $(node -v)"
echo "npm: $(npm -v)"
echo "Docker: $(docker -v)"
echo "Docker Compose: $(docker-compose --version)"
echo "Terraform: $(terraform -version | head -n 1)"
echo "Ansible: $(ansible --version | head -n 1)"
echo "kubectl: $(kubectl version --client --short)"

# Clonar el repositorio si no existe
REPO_DIR="CloudOps_Blueprint"
if [ ! -d "$REPO_DIR" ]; then
    echo "📁 Clonando repositorio..."
    git clone https://github.com/omaciasd/CloudOps_Blueprint.git
fi
cd "$REPO_DIR" || exit 1

# Instalar dependencias del proyecto Node.js
echo "📦 Instalando dependencias del proyecto..."
npm install

# Levantar contenedor con Docker Compose (si existe)
if [ -f "docker-compose.yml" ]; then
    echo "🛠️ Ejecutando Docker Compose..."
    docker-compose up -d
else
    echo "⚠️ docker-compose.yml no encontrado. Saltando despliegue de contenedor."
fi

echo "✅ Entorno completamente configurado. ¡Todo listo para trabajar! ☁️🚀"
