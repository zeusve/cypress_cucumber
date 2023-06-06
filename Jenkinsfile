pipeline {
    agent any
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/**/**', description: 'Ej: cypress/**/**.feature')
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
    }

    stages {
        
        
        stage('Run'){
            steps {
                echo "Building the application"
            }
        }
       
        stage('Run Tests') {
            steps {
                bat "npx cypress run --browser ${params.BROWSER} --headless --env allure=true"
            }
        }

        stage('Allure Report') {
            steps {
                bat 'npx allure generate allure-results --clean -o allure-report'
            }
        }

        stage('Configure Allure') {
            steps {
                script {
                    allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
                }
            }
        }

        stage('Notify Telegram') {
            steps {
                script {
                    telegramSend(chatId: 6006691816, message: "The build is OK")
                }
            }
        }


    }
}
