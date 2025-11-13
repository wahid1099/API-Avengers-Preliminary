pipeline {
    agent any

    environment {
        IMAGE_NAME = "demo-app"
        CONTAINER_NAME = "demo-app"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Unit Test') {
            steps {
                echo "Running mock tests..."
                sh 'python -m unittest discover -s app -p "test_*.py"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying via docker-compose..."
                sh 'docker-compose up -d --build'
            }
        }

        stage('Health Check') {
            steps {
                echo "Checking application health..."
                sh './healthcheck.sh'
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh 'docker-compose down || true'
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
