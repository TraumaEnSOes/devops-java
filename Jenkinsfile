agent docker 'maven:3.8.6-openjdk-11-slim'

environment {
    CI = 'true'
}

stages {
    stage('Build') {
        steps {
            sh 'mvn install'
        }
    }
    stage('Testing') {
        steps {
            sh 'mvn test'
        }
    }
    stage('Packaging') {
        steps {
            sh 'mvn package'
        }
    }
}
