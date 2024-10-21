pipeline {
    agent any
    tools {
        maven 'M2_HOME' // Ensure 'Maven-3.9.9' is the correct name set in Global Tool Configuration
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
