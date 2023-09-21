pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from your Git repository
                checkout scm
            }
        }
        
        stage('Deploy to Google Cloud Storage') {
            steps {
                script {
                    // Authenticate with Google Cloud using a service account key (JSON key file)
                    withCredentials([file(credentialsId: 'GCLOUD_KEY', variable: 'GCLOUD_KEY')]) {
                        sh 'gcloud auth activate-service-account --key-file=gcloud-key.json'
                        sh 'gcloud config set project devops-399217'
                        sh 'gsutil -m rsync -r ./path/to/your/static/website gs://mybuket131646485/'
                    }
                }
            }
        }
    }
    
}