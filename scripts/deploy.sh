#!/bin/bash
set -e

APP_NAME=$1
BRANCH=$2

echo "🚀 Desplegando $APP_NAME ($BRANCH)..."

cd /apps/$APP_NAME

# Actualiza el repositorio
if [ -d .git ]; then
  git fetch origin
  git reset --hard origin/main
else
  git clone https://github.com/tuusuario/$APP_NAME.git .
fi

# Reconstruye y reinicia el servicio
docker compose build $APP_NAME
docker compose up -d $APP_NAME

echo "✅ Despliegue completado: $APP_NAME"
