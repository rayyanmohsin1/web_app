pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rayyanmohsin1/web_app'
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t rayyanmohsin/web_app .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push rayyanmohsin/web_app'
            }
        }
    }
}
