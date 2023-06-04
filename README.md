#  Dockerización de Proyecto y Ejecución de script.sh

En este tutorial, aprenderemos cómo **dockerizar** un proyecto y ejecutar el archivo **script.sh** desde un contenedor Docker.

## Paso 1: Preparar el entorno

Descargar e instalar docker en su máquina pincha aquí    [![download docker](https://img.icons8.com/?size=1x&id=22813&format=png "download docker")](https://img.icons8.com/?size=1x&id=22813&format=png "download docker")

------------

## Paso 2: Clona el repositorio y navega hasta el mismo

```bash
git clone https://github.com/zeusve/cypress_cucumber.git

cd cypress_cucumber

```

## Paso 3: Ejecuta el archivo Dockerfile

```bash
docker build -t cypress_cucumber .
```

## Paso 4: Iniciar la imagen Docker

```bash
docker run -it cypress_cucumber
```

## Paso 5: Ejecuta el archivo script.sh en la imagen de docker

```bash
./script.sh
```

## Paso 5: Lanza los casos de prueba

```bash
npx run cypress --browser chrome --spec cypress/**/* --env allure=true
```
