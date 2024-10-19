pipeline {
    agent any
    tools {
        maven 'Maven 3.9.9'  // Use the name of the Maven installation from Global Tool Configuration
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            when {
                branch 'main'  // This stage runs only when the branch is 'main'
            }
            steps {
                bat 'mvn deploy'  // Deploys the build artifact (if applicable)
            }
        }
    }
    post {
        success {
            echo 'Build and Test stages completed successfully.'
        }
        failure {
            echo 'Build or Test stage failed.'
        }
    }
}
