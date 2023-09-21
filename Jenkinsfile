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
                    withCredentials([file(credentialsId: 'AIzaSyB9t_hGbN8fg-fURKir-O4JVwZijXFNNDE', variable: 'GCLOUD_KEY')]) {
                        sh 'echo $GCLOUD_KEY > gcloud-key.json'
                        sh 'gcloud auth activate-service-account --key-file=gcloud-key.json'
                        
                        // Set your Google Cloud project
                        sh 'gcloud config set project devops-399217'
                        
                        // Deploy your static website to Google Cloud Storage
                        sh 'gsutil -m rsync -r ./path/to/your/static/website gs://your-bucket-name/'
                    }
                }
            }
        }
    }
    
}