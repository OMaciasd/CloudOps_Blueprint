#!/bin/bash

# cleanup.sh
# 🧼 Script para limpiar recursos locales: contenedores, imágenes, volúmenes y archivos temporales

echo "🧹 Starting cleanup process..."

# 1. Eliminar contenedores detenidos
echo "🗑️ Removing stopped containers..."
docker container prune -f

# 2. Eliminar imágenes no utilizadas
echo "📦 Removing unused images..."
docker image prune -a -f

# 3. Eliminar volúmenes no utilizados
echo "🪣 Removing unused volumes..."
docker volume prune -f

# 4. Eliminar redes no utilizadas
echo "🌐 Removing unused networks..."
docker network prune -f

# 5. Eliminar archivos temporales y logs locales (ajusta las rutas según tu proyecto)
echo "🧾 Deleting temporary files and logs..."
rm -rf ./logs/*
rm -rf ./tmp/*
rm -rf ./__pycache__/
rm -rf .DS_Store

# 6. Confirmación final
echo "✅ Cleanup completed successfully."
