# Utilizar una imagen base de Ubuntu
FROM ubuntu:latest

# Actualizar los paquetes del sistema
RUN apt-get update

# Instalar dependencias necesarias
RUN apt-get install -y curl wget libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 xvfb git libatk-bridge2.0-0

# Instalar Node.js y NPM
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Instalar OpenJDK 11
RUN apt-get install -y openjdk-11-jdk

# Instalar la biblioteca libgtk-3
RUN apt-get install -y libgtk-3-0

# Instalar la biblioteca libgbm1
RUN apt-get install -y libgbm1

# Configurar el servidor X virtual (Xvfb)
RUN apt-get install -y xvfb
ENV DISPLAY=:99
RUN Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

# Crear un directorio de trabajo
WORKDIR /app

# Clonar el repositorio Git dentro del contenedor
RUN git clone https://github.com/zeusve/cypress_cucumber.git .

# Copiar los archivos necesarios al contenedor
COPY run-dev-test.sh /app/run-dev-test.sh
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

# Instalar las dependencias del proyecto
RUN npm install
RUN npm install cypress

# Dar permisos de ejecución al script
RUN chmod +x /app/run-dev-test.sh

# Configurar la variable de entorno JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Ajustar el comando de ejecución de Cypress
CMD xvfb-run -a --server-num=99 --server-args="-screen 0 1024x768x24 -ac +extension RANDR" npx cypress run
