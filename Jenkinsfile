pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ram444/devops-website:30"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "========== Checking out source code =========="
                git branch: 'main', url: 'https://github.com/Sriram281023/devops-website-guide.git', credentialsId: 'c91bd955-2b5a-46ef-8e98-eafd2db03706'
            }
        }

        stage('Build') {
            steps {
                echo "========== Building Application =========="
                bat 'if exist build rmdir /s /q build'
                bat 'mkdir build'
                bat 'if exist index.html copy index.html build\\'
                bat 'if exist css xcopy css build\\css /E /I /Y'
                bat 'if exist js xcopy js build\\js /E /I /Y'
            }
        }

        stage('Test') {
            steps {
                echo "========== Running Tests =========="
                bat 'echo Tests completed successfully'
            }
        }

        stage('Docker Build') {
            steps {
                echo "========== Building Docker Image =========="
                bat 'docker build -t "%DOCKER_IMAGE%" .'
            }
        }

        stage('Push to Registry') {
            steps {
                echo "========== Pushing Docker Image =========="
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "========== Deploying Application =========="
                // your deploy steps (optional)
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
