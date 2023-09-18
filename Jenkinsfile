pipeline {
  agent any

    environment {
    registry = "brunosantos88/webfrontend"
    registryCredential = 'dockerlogin'
  }


  stages{

    stage('Clone repository') { 
steps { 
script{
checkout scm
}
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

    stage('Kubernetes Deployment aplicação venda') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f deployment.yaml --namespace=devops')
		}
	      }
   	}

   }
}