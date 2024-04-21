pipeline {
    
    stages {
        stage('checkout GIT') {
            steps {
                echo 'Pulling ...'
                git branch: 'aicha',
                    url: 'https://github.com/nadaTLILI/ProjetDevops.git'
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
    }
}
