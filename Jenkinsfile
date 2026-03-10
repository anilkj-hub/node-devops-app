pipeline {
    agent any

    environment {
        IMAGE = "anilkumarjena22/node-devops-app"
        EC2_IP = "13.60.76.252"
        KEY = "C:/node-devops-key.pem"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/anilkj-hub/node-devops-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE% .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                bat 'docker push %IMAGE%'
            }
        }

        stage('Deploy to EC2') {
            steps {
                bat """
                ssh -o StrictHostKeyChecking=no -i %KEY% ubuntu@%EC2_IP% ^
                "docker pull %IMAGE% && \
                docker stop node-container || true && \
                docker rm node-container || true && \
                docker run -d -p 3000:3000 --name node-container %IMAGE%"
                """
            }
        }

    }
}