pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone your React project from your repository
                git branch: 'main', url: 'https://github.com/fontaineha1281/capstone2.git'
            }
        } 
        stage('Deploy to linux-anh') {
            steps {
                // Add your deployment steps here
                // Example:
                sh 'echo "Deploying to linux-anh"'
            }
        }
    }
}
