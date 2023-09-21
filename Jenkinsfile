pipeline {
  agent any

    environment {
    registry = "brunosantos88/webfrontend"
    registryCredential = 'dockerlogin'
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
     
     
     //kube#
    stage('Kubernetes Deployment Frontend') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f deployment.yaml --namespace=devops')
		}
	      }
   	}

   }
}
