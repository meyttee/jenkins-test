pipeline {
  agent any
  tools { nodejs 'nodejs' }

  stages {
    stage('Install') { steps { sh 'node -v && npm install lodash &&npm ci || npm install' } }
    stage('Test2')    { steps { sh 'npm test' } }
    stage('Build')   { steps { sh 'npm run build' } }
    stage('Deploy') {
      when { expression { params.ENV == 'staging' } }
      steps { echo "Deploying to ${params.ENV}" }
    }
  }

    parameters {
    choice(name: 'ENV', choices: ['dev', 'staging'], description: 'Target env')
    }

  post {
    failure { echo 'Build broke!' }
  }
}
