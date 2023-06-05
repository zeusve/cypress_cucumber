# Utilizar una imagen base de Ubuntu
FROM ubuntu:latest

# Instalaciones
RUN apt update -y && apt upgrade -y && apt install -y git

# Configurar directorio de trabajo
WORKDIR /aps

# Clone repository
RUN git clone https://github.com/zeusve/cypress_cucumber.git /aps

# Changue permissions of the script.sh
RUN chmod +x /aps/script.sh



