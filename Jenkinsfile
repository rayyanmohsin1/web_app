pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = "rayyanmohsin/web_app"
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out the repository
                git url: 'https://github.com/rayyanmohsin1/web_app', branch: 'main'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Run Maven to clean, compile, and package the project
                bat 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image using Dockerfile in the root directory
                    def app = docker.build("${DOCKER_IMAGE_NAME}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        app.push('latest')
                    }
                }
            }
        }
    }
}
