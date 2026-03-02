pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                checkout scmGit(branches: 
            }
        }
        stage('Archive Artifact') {https://github.com/Uday-63/portfolio-project.git
            steps {
                archiveArtifacts artifacts: 'src/**', fingerprint: true
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio-image .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker stop portfolio-container || true'
                sh 'docker rm portfolio-container || true'
                sh 'docker run -d -p 4000:80 --name portfolio-container portfolio-image'
            }
        }
    }
}
