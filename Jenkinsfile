pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git(
                    branch: 'main',
                    url: 'https://github.com/Uday-63/portfolio-project.git'
                )
            }
        }

        stage('Verify Photo') {
            steps {
                sh '''
                echo "Checking images folder"
                ls -l images || echo "images folder not found"
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolioimage .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f uday || true
                docker run -d --name uday -p 4000:80 portfolioimage
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Jenkins build successful – photo deployed"
        }
        failure {
            echo "❌ Jenkins build failed"
        }
    }
}
