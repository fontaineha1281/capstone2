pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone your React project from your repository
                git branch: 'main', url: 'https://github.com/fontaineha1281/capstone2.git'
            }
        } 
        stage('Sonar Analysis') {
            environment {
                scannerHome = tool 'sonar'
            }
            steps {
                withSonarQubeEnv('sonar') {
                    sh "${scannerHome}/bin/sonar-scanner" +
                        " -Dsonar.projectKey=capstone2-test" +
                        " -Dsonar.projectName=capstone2-test" +
                        " -Dsonar.projectVersion=1.0" +
                        " -Dsonar.sources=web/src/"
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Capstone2/'
                sh 'sudo cp -r * /root/test/'
                sh 'sudo docker-compose -f /root/test/web/docker-compose.yml up -d --force-recreate'
            }
        }      
    }
}
