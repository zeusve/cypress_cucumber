pipeline {
    agent any

    stages {
       
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
