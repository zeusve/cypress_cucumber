# Utilizar una imagen base de Ubuntu
FROM ubuntu:latest

# Configurar directorio de trabajo
WORKDIR /app

# Clone repository
RUN git clone https://github.com/zeusve/cypress_cucumber.git 

# Change to the project directory
RUN cd cypress_cucumber



