node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonar'
    withSonarQubeEnv('sonar') {
      sh "${scannerHome}/bin/sonar-scanner \
        -D sonar.login=admin \
        -D sonar.password=haduyanh \
        -D sonar.projectKey=capstone2 \
        -D sonar.host.url=http://20.193.243.241:9000/ \
        -D sonar.sources=web/source/cauhoi.php"
    }
  }
  stage('Build Docker Image') {
    sh 'docker build -t web .'
  }
  stage('Push to Docker Hub') {
    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
      sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
      sh 'docker push web'
    }
  }
  stage('Deploy to Server') {
    // Deploy the Docker image to your server
    // Add your deployment steps here
    // For example, you can use SSH to connect to the server and run Docker commands
    // Refer to the documentation of your deployment setup for the specific commands
  }
}
