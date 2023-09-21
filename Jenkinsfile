pipeline {
  agent any

    environment {
    registry = "brunosantos88/webfrontend"
    registryCredential = 'dockerlogin'
    PROJECT_ID = ('ProjectID')
    CLUSTER_NAME = 'mycluster-dev1'
    LOCATION = 'us-central1'
    CREDENTIALS_ID = ('gcloud-creds')
  }


  stages{

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/SITEWEB.git', branch: 'main',
    credentialsId: 'jenkins-server_local'
          }
  }
  
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
     

    stage('Deploy to GKE') {
            steps{
                sh "kubectl apply -f deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
   }
