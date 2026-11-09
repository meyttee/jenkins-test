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
      when { expression { params.ENV == 'staging' } }
      steps { echo "Deploying to ${params.ENV}" }
    }

    stage('Docker Build') {
      steps {
        script {
          def img = docker.build("localhost:5000/jenkins-test:${env.BUILD_NUMBER}")
          img.inside { sh 'node -v' }
        }
      }
    }

    stage('Push') {
      steps {
        script {
          docker.withRegistry('http://localhost:5000') {
            img.push()
          }
        }
      }
    }
  }

    parameters {
    choice(name: 'ENV', choices: ['dev', 'staging'], description: 'Target env')
    }

  post {
    failure { echo 'Build broke!' }
  }
}
