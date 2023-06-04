# Utilizar una imagen base de Ubuntu
FROM ubuntu:latest

# Instalaciones
RUN apt update -y && apt install -y git

# Configurar directorio de trabajo
WORKDIR /app

# Clonar el repositorio Git dentro del contenedor
RUN git clone https://github.com/zeusve/cypress_cucumber.git /app

# Permisos ejecución 
RUN chmod +x /app/script.sh



