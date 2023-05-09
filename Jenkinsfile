node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonar';
    withSonarQubeEnv('sonar') {
      sh "${scannerHome}/bin/sonar-scanner \
      -D sonar.login=admin \
      -D sonar.password=haduyanh \
      -D sonar.projectKey=capstone2 \
      -D sonar.host.url=http://20.193.243.241:9000/ \
      -D sonar.sources=/web/source/cauhoi.php"
    }
  }
}
