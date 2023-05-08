pipeline {
    agent {
        label 'linux-anh'
    }
    stages {
        stage('Checkout') {
            steps {
                // Clone your project from your repository
                git branch: 'main', url: 'https://github.com/fontaineha1281/capstone2.git'
            }
        } 
        stage('Deploy') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Capstone2/'
                sh 'sudo cp -r * /root/test/'
                sh 'sudo docker compose -f /root/test/web/docker-compose.yml up -d --force-recreate'
            }
        }      
    }
}
