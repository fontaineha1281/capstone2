pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/fontaineha1281/capstone2.git'
            }
        }

        stage('Deploy to linux-anh') {
            agent {
                node {
                    label 'linux-anh'
                }
            }     
        }
    }
}
