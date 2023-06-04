# Utilizar una imagen base de Ubuntu
FROM ubuntu:latest

# Permisos ejecución 
RUN chmod +x ./script.sh

# Ejecutar archivo
RUN ./script.sh