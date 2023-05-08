pipeline {
    agent any
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/**/**', description: 'Ej: cypress/**/**.feature')
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
    }

    stages {
        
        stage('Build'){
            //The steps section defines a series of one or more steps to be executed in a given stage directive.
            steps {
                echo "Building the application"
            }
        }
       
        stage('Run Tests') {
            steps {
                // Ejecuta los tests con Cypress y Cucumber
                bat 'npx cypress run --browser chrome --headless'
            }
        }
        
        stage('Generate Allure Report') {
            steps {
                // Genera el reporte con Allure
                bat 'npx allure generate --clean && npx allure open'
            }
        }
    }
}
