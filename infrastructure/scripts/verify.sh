#!/bin/bash

echo "🔍 Verificando entorno de desarrollo..."

# Herramientas requeridas
REQUIREMENTS=("git" "node" "npm" "docker" "terraform" "ansible" "kubectl")
OPTIONALS=("helm")

# Función para verificar cada comando
check_command() {
  if ! command -v $1 &> /dev/null; then
    echo "❌ $1 no está instalado."
    return 1
  else
    echo "✅ $1 encontrado: $($1 --version | head -n 1)"
    return 0
  fi
}

# Validación principal
ALL_OK=true
for tool in "${REQUIREMENTS[@]}"; do
  check_command "$tool" || ALL_OK=false
done

echo ""
echo "📦 Herramientas opcionales:"
for tool in "${OPTIONALS[@]}"; do
  check_command "$tool"
done

# Verificar que Docker esté corriendo
echo ""
echo "🐳 Verificando conexión con Docker..."
if docker info > /dev/null 2>&1; then
  echo "✅ Docker está activo."
else
  echo "❌ Docker no está corriendo o requiere privilegios elevados."
  ALL_OK=false
fi

# Resultado final
echo ""
if [ "$ALL_OK" = true ]; then
  echo "🎉 Todo listo para comenzar el despliegue."
else
  echo "⚠️ Por favor instala las herramientas marcadas con ❌ antes de continuar."
fi
