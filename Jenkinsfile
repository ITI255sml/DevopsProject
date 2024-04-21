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
            steps {
                sh "mvn clean verify sonar:sonar -Dsonar.projectKey=devopsProject -Dsonar.projectName='devopsProject'"
            }
        }
        stage('DockerBuild') {
            environment {
                DOCKER_HUB_USERNAME = 'yosraMastouri'
            }
            steps {
                sh '''
                    docker build -t $DOCKER_HUB_USERNAME/devops-project-image:1 .
                '''
            }
        }
        stage('DockerStart') {
            environment {
                DOCKER_HUB_USERNAME = 'yosraMastouri'
            }
            steps {
                sh '''
                    docker run -d -p 8089:8089 $DOCKER_HUB_USERNAME/devops-project-image:1
                    docker start $DOCKER_HUB_USERNAME/devops-project-image:1
                '''
            }
        }
    }
}
