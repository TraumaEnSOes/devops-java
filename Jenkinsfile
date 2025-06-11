pipeline {
    agent {
        docker {
            image 'maven:3.8.6-openjdk-11-slim'
        }
    }

    environment {
        CI = 'true'
    }

    stages {
        stage( 'Build & Analisys' ) {
            withSonarQubeEnv( 'My SonarQube Server' ) {
                sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=java'
            }
        }

        stage( 'Testing' ) {
            steps {
                sh 'mvn test'
            }
        }

        stage( 'Analisys' ) {
            steps {
                timeout( time: 1, unit: 'HOURS' ) {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
