pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'command_to_run_build'
            }
        }
        stage('Test') {
            steps {
                bat 'command_to_run_build'
            }
        }
    }
}
