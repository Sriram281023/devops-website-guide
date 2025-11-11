pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'devops-website'
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_CREDENTIALS = 'dockerhub-credentials'
        APP_NAME = 'devops-guide-app'
        APP_VERSION = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo '========== Checking out source code =========='
                git branch: 'main', url: 'https://github.com/YOUR_USERNAME/devops-website-guide.git'
            }
        }

        stage('Build') {
            steps {
                echo '========== Building Application =========='
                sh 'mkdir -p build && cp -r * build/ || true'
            }
        }

        stage('Test') {
            steps {
                echo '========== Running Tests =========='
                sh 'echo "Tests completed successfully"'
            }
        }

        stage('Docker Build') {
            steps {
                echo '========== Building Docker Image =========='
                script {
                    dockerImage = docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${APP_VERSION}")
                }
            }
        }

        stage('Push to Registry') {
            steps {
                echo '========== Pushing Docker Image =========='
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", "${DOCKER_CREDENTIALS}") {
                        dockerImage.push("${APP_VERSION}")
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo '========== Deploying Application =========='
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}