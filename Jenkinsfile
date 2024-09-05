pipeline {
    agent any

    environment {
        // Set the path to your Maven installation
        MAVEN_HOME = 'D:\\Devops\\apache-maven-3.9.9'
        PATH = "${MAVEN_HOME}\\bin;${env.PATH}"
        TOMCAT_HOME = "D:\\Devops\\apache-tomcat-9.0.56"  // Example path to Tomcat
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                git branch: 'master', url: 'https://github.com/Mastercoder0406/simple-java-maven-app.git'
            }
        }

        stage('Build') {
            steps {
                // Run Maven to build the project
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run Maven to execute tests
                sh 'mvn test'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Copy the WAR file to the Tomcat webapps directory
                sh 'cp target/your-app.war $TOMCAT_HOME\\webapps\\'
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }

        success {
            // Notify success
            echo 'Build and deployment successful!'
        }

        failure {
            // Notify failure
            echo 'Build or deployment failed.'
        }
    }
}
