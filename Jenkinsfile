pipeline {
    agent any
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/**/**', description: 'Ej: cypress/**/**.feature')
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
        string(name: 'telegram_chat_id', defaultValue: '', description: 'Telegram Chat ID')
    }

    stages {
        
        stage('Install Dependencies') {
            steps {
                dir('my-project-directory') {
                    bat 'npm install'
                    bat 'npx cypress verify'
                    bat "curl -o allure-2.22.0.tgz -Ls https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.22.0/allure-commandline-2.22.0.tgz"
                    bat "tar -zxvf allure-2.22.0.tgz"
                }
            }
        }
        
        stage('Build'){
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
            when {
                expression { params.telegram_chat_id != '' }
            }
            steps {
                script {
                    telegramSend(chatId: params.telegram_chat_id, message: "The build is OK")
                }
            }
        }


    }
}
