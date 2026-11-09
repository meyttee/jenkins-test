pipeline {
  agent any
  tools { nodejs 'nodejs' }

  stages {
    stage('Install') { steps {
        sh 'node -v && npm install lodash &&npm ci || npm install'
        } }
    stage('Test')    { steps { sh 'npm test' } }
    stage('Build')   { steps { sh 'npm run build' } }
    stage('Deploy') {
      steps { echo "Deploying to ${params.ENV}" }
    }

    stage('Docker Build') {
      steps {
        script {
          def img = docker.build("localhost:5000/jenkins-test:${env.BUILD_NUMBER}")
          img.push()
        }
      }
    }
  }
  post {
    failure { echo 'Build broke!' }
  }
}
