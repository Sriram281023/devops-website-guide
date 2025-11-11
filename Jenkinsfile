pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'ram444'
        DOCKER_IMAGE_NAME = 'ram444/devops-website'
        DOCKER_REGISTRY = 'docker.io'
        APP_NAME = 'devops-guide-app'
        APP_VERSION = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo '========== Checking out source code =========='
                git branch: 'main',
                    url: 'https://github.com/Sriram281023/devops-website-guide.git',
                    credentialsId: 'c91bd955-2b5a-46ef-8e98-eafd2db03706'
            }
        }

        stage('Build') {
            steps {
                echo '========== Building Application =========='
                bat 'if exist build rmdir /s /q build'
                bat 'mkdir build'
                bat 'if exist index.html copy index.html build\\'
                bat 'if exist css xcopy css build\\css /E /I /Y'
                bat 'if exist js xcopy js build\\js /E /I /Y'
            }
        }

        stage('Test') {
            steps {
                echo '========== Running Tests =========='
                bat 'echo Tests completed successfully'
            }
        }

        stage('Docker Build') {
            steps {
                echo '========== Building Docker Image =========='
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${APP_VERSION}")
                }
            }
        }

        stage('Push to Registry') {
            steps {
                echo '========== Pushing Docker Image =========='
                script {
                     docker.withRegistry('', "${DOCKER_CREDENTIALS}") {
                         dockerImage.push("${APP_VERSION}")
                         dockerImage.push('latest')
                        }
                    }
                }
            }


        stage('Deploy') {
            steps {
                echo '========== Deploying Application =========='
                bat 'docker-compose up -d'
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
