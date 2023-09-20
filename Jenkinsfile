pipeline {
  agent any
}
    environment {
    GCLOUD_CREDS=credentials('gcloud-creds')
    PROJECT_ID=('ProjectID')
    REGISTRY_REGION = 'us-central1'  // Substitua pela região desejada
    IMAGE_NAME = 'Frontend'
    IMAGE_TAG = 'Frontend'
    ARTIFACT_REGISTRY = "gcr.io/${PROJECT_ID}"
    ARTIFACT_REGISTRY_IMAGE = "${ARTIFACT_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
  }


stages{

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/SITEWEB.git', branch: 'main',
    credentialsId: 'jenkins-server_local'
          }
  }

  
      stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${ARTIFACT_REGISTRY_IMAGE} ${DOCKERFILE_PATH}"
                }
            }
        }

        stage('Push Docker Image to Artifact Registry') {
            steps {
                script {
                    // Authenticate with Google Cloud
                    sh "gcloud auth configure-docker ${REGISTRY_REGION}-docker.pkg.dev"

                    // Push the Docker image to Artifact Registry
                    sh "docker push ${ARTIFACT_REGISTRY_IMAGE}"
                }
            }
        }
    }
