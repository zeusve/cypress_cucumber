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

        }

 
        post {
                // trigger every-works
            always {
                slackSend channel: 'jenkins-notify', message: 'RUN FINISH'
            }
                // only triggered when blue or green sign
            success {
                slackSend channel: 'jenkins-notify', message: 'Succes'
            }
                // triggered when red sign
            failure {
                slackSend channel: 'jenkins-notify', message: 'Failure'
            }
            
        }
 
}
