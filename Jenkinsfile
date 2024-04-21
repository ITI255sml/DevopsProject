pipeline {
    agent any
    stages {
        stage('checkout GIT') {
            steps {
                echo 'Pulling ...'
                git branch: 'main',
                    url: 'https://github.com/ITI255sml/DevopsProject'
            }
        }
        stage('Affichage de la date système') {
            steps {
                sh 'date'
            }
        }
        stage('maven version') {
            steps {
                sh 'mvn -version'
            }
        }
        stage('Maven Clean') {
            steps {
                sh 'mvn clean -U'
            }
        }

        stage('Maven Compile') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('SonarQube Analysis') {
    def mvn = tool 'Default Maven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=devopsProject -Dsonar.projectName='devopsProject'"
    }
  }
    }
}
