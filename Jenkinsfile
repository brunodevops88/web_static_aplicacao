pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-1"
    THE_BUTLER_SAYS_SO=credentials('aws-creds')
  }

  tools { 
        ///depentencias 
        terraform 'Terraform 1.3.7' 
        maven 'Maven_3_5_2'  
    }
  
stages {

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/SITEWEB.git', branch: 'main',
    credentialsId: 'jenkinsserver'
          }
  }


    // InfraIsCode

    stage('Autentication AWS') {
      steps {
        sh '''
          aws --version
          aws ec2 describe-instances
        '''
      }
    }

    stage('Terraform Iniciar') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Formatar') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('Terraform Aplicar') {
            steps {
          sh '''
          terraform apply -auto-approve
          '''

            }
        }


stage('Deploy Bucket S3 Frontend') {
        steps {
               script {
                   def bucketName = 'my-static-jenkinslastime'
                  def sourceDir = './web'
                    
              ///Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
               }
            }
}
}
}