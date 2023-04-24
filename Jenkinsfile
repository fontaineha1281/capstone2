pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone your React project from your repository
                git branch: 'main', url: 'https://github.com/fontaineha1281/capstone2.git'
            }
        } 
        stage('Deploy') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Capstone2/web'
                sh 'sudo docker build -t capstone2 .'
            }
        }      
    }
}
