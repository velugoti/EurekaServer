pipeline {
    agent any

    environment {
        IMAGE_NAME = "svelugoti/custom-eurekaserver"
        CONTAINER_NAME = "eureka-server-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/velugoti/EurekaServer.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean build -x test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 8761:8761 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }
}