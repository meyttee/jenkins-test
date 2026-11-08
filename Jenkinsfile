pipeline {
  agent any
  tools { nodejs 'nodejs' }

  stages {
    stage('Install') { steps {
        sh 'sleep 5'
        sh 'node -v && npm install lodash &&npm ci || npm install'
        } }
    stage('Test')    { steps { sh 'pnpm test' } }
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
