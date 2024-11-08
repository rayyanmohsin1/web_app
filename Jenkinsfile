pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = "rayyanmohsin/web_app"
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/rayyanmohsin1/web_app', branch: 'main'
            }
        }
        
        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }
        
        stage('Docker Login') {
            steps {
                script {
                    bat "docker login -u %DOCKER_HUB_CREDENTIALS_USR% -p %DOCKER_HUB_CREDENTIALS_PSW%"
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }
        
        stage('Docker Push') {
            steps {
                bat "docker push %DOCKER_IMAGE%"
            }
        }
    }
}
