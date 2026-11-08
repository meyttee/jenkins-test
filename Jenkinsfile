pipeline {
  agent any

  environment {
    APP_NAME = 'jenkins-test'
  }

  stages {
    stage('Checkout info') {
      steps {
        echo "Building ${APP_NAME}"
        sh 'ls -la'
      }
    }
    stage('Test') {
      steps {
	sh 'echo "test stage"'
        sh 'echo "running tests..."'
      }
    }
    stage('Build') {
      steps {
	sh 'echo "build stage"'
        sh 'cat README.md'
      }
    }
  }

  post {
    success { echo 'Pipeline succeeded' }
    failure { echo 'Pipeline failed' }
    always  { echo 'Done' }
  }
}
