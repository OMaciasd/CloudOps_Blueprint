# Usa Nginx como servidor web
FROM nginx:alpine

# Elimina archivos default de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia los archivos compilados del frontend
COPY dist/ /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Inicia Nginx
CMD ["nginx", "-g", "daemon off;"]
