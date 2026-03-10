pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-devops-app"
        CONTAINER_NAME = "node-container"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build Application') {
            steps {
                bat 'echo Building application...'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'echo Running tests...'
            }
        }

        stage('QA Check') {
            steps {
                bat 'echo Performing QA checks...'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat 'docker stop %CONTAINER_NAME%'
                bat 'docker rm %CONTAINER_NAME%'
            }
        }

        stage('Deploy Container') {
            steps {
                bat 'docker run -d -p 3000:3000 --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }

    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}