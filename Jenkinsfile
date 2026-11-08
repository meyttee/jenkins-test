pipeline {
  agent any
  tools { nodejs 'node20' }

  stages {
    stage('Install') { steps { sh 'node -v && npm ci || npm install' } }
    stage('Test')    { steps { sh 'npm test' } }
    stage('Build')   { steps { sh 'npm run build' } }
  }

  post {
    failure { echo 'Build broke!' }
  }
}
