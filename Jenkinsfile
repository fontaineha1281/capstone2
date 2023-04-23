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
                sh 'cd /var/lib/jenkins/workspace/capstone2/'
#               sh 'sudo cp -r * /var/www/hotel/'
#               sh 'sudo systemctl reload nginx'
                sh 'cd web"
                sh 'docker compose up'
            }
        }
    }
}
