pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                url: https://github.com/Uday-63/portfolio-project.git
            }
        }

        stage('Verify Photo') {
            steps {
                sh '''
                echo "Checking image folder..."
                ls -l images
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolioimage .'
            }
        }

        stage('Deploy Website') {
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
            echo "✅ Photo updated & website deployed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
