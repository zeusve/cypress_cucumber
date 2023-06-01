# Imagen con cypress
FROM cypress/included:12.3.0

# Clonar el repositorio dentro del contenedor
RUN git clone https://github.com/zeusve/cypress_cucumber.git /app

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración de Cypress
COPY cypress.config.js /app
COPY cypress /app
COPY ./cypress /app

# Instala las dependencias
# Ejecutar las pruebas y generar el reporte de Allure
CMD ["sh", "run-dev&test.sh"]


