pipeline {
    agent any


   environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = 'shivanshipatel/recipeapp'
        DOCKER_IMAGE_TAG = 'latest'
    }


   stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", '-f Dockerfile .')
                }
            }
        }


       stage('Package') {
            steps {
                script {
                    // Package the Docker image (not needed for this scenario but can be useful for additional steps)
                    // You can add any additional packaging steps here if needed
                    echo "Creating Jenkins file"
                }
            }
        }


       stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        // Push the Docker image to Docker Hub
                        docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }
    }


   post {
        success {
            echo 'Pipeline successfully completed! Docker image has been pushed to Docker Hub.'
        }
        failure {
            echo 'Pipeline failed. Please check the Jenkins console output for details.'
        }
    }
}
