#  Dockerización de Proyecto y Ejecución de script.sh

En este tutorial, aprenderemos cómo **dockerizar** un proyecto y ejecutar el archivo **script.sh** desde un contenedor Docker.

## Paso 1: Preparar el entorno

Descargar e instalar docker en su máquina [Download Docker][1]
[1]: https://www.docker.com/products/docker-desktop/ "Docker"

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

## Paso 6: Lanza los casos de prueba

```bash
npx run cypress --browser chrome --spec cypress/**/* --env allure=true
```


