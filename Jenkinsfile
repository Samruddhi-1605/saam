pipeline {
    agent any

    environment {
        // Ensure this ID matches what you saved in Jenkins Credentials Provider
        DOCKERHUB_CREDENTIALS = 'crampy'
        IMAGE_NAME = 'samruddhics/new_docker_image'
    }

    stages {
        stage('1. Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('2. Checkout') {
            steps {
                checkout scm
            }
        }

        stage('3. Compile Java') {
            steps {
                // Verifies the code compiles before we try to build an image
                bat 'javac Hello.java'
            }
        }

        stage('4. Unit Test') {
            steps {
                // Verifies the program runs as expected
                bat 'java Hello'
            }
        }

        stage('5. Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('6. DockerHub Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKERHUB_CREDENTIALS}",
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {
                        bat 'echo %PASS% | docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('7. Push to Registry') {
            steps {
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}
