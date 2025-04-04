# Usa Node.js como base
FROM node:18-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del proyecto
COPY package*.json ./
COPY . .

# Instala dependencias
RUN npm install --only=production

# Expone el puerto en el que corre el backend
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "run", "start"]
