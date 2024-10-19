pipeline {
    agent any
    tools {
        maven 'Maven'  // Name of the Maven installation set in Jenkins (as configured earlier)
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
