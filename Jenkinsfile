pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'Docker-credentials'
        IMAGE_NAME = 'shilpakevala/new_docker_image'
    }

    stages {

        stage('Build Python Application') {
            steps {
                // Checking for syntax errors (equivalent to a build check)
                bat 'python -m py_compile hello.py'
            }
        }

        stage('Run Python Program') {
            steps {
                // Running the python script
                bat 'python hello.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                credentialsId: 'Docker-credentials',
                usernameVariable: 'USER',
                passwordVariable: 'PASS')]) {

                    bat 'echo %PASS%| docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}
