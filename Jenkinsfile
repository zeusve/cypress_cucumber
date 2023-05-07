pipeline {
    agent any

    stages {
        
        stage('Checkout') {
            steps {
                // Checkout del código fuente
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/zeusve/cypress_cucumber.git']]])
            }
        }
       
        stage('Run Tests') {
            steps {
                // Ejecuta los tests con Cypress y Cucumber
                sh 'npx cypress run --browser chrome --headless'
            }
        }
        
        stage('Generate Allure Report') {
            steps {
                // Genera el reporte con Allure
                sh 'npx allure generate --clean && npx allure open'
            }
        }
    }
}
