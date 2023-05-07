pipeline {
    agent any
    tools {
        nodejs "node" // Instala y configura NodeJS en la máquina de Jenkins
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install' // Instala las dependencias del proyecto
            }
        }
        stage('Run tests') {
            steps {
                sh './node_modules/.bin/cypress run --headed --browser chrome --spec "cypress/**/*"'
                // Ejecuta los tests de Cypress en modo headed y en Chrome
                // Este comando asume que los archivos de especificaciones de Cypress están en la carpeta cypress/integration
            }
        }
        stage('Generate Allure report') {
            steps {
                sh './node_modules/.bin/allure generate --clean' // Genera el reporte de Allure
                allure includeProperties: false, jdk: '', properties: [], reportBuildPolicy: 'ALWAYS',
                       results: [[path: 'allure-results']] // Incluye el reporte de Allure en Jenkins
            }
        }
    }
}
