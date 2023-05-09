import groovy.json.JsonOutput

pipeline {
    agent any
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/**/**', description: 'Ej: cypress/**/**.feature')
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
    }

    stages {
        
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
                bat 'npx cypress verify'
            }
        
        
            steps {
                bat "curl -o allure-2.14.0.tgz -Ls https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.14.0/allure-commandline-2.14.0.tgz"
                bat "tar -zxvf allure-2.14.0.tgz"
            }
        }
        
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
