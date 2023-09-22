pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-1"
    THE_BUTLER_SAYS_SO=credentials('aws-creds')
  }

  tools { 
        ///depentencias 
        terraform 'Terraform 1.3.7' 
    }
  
  stages {
    stage('Teste AWS') {
      steps {
        sh '''
          aws --version
          aws ec2 describe-instances
        '''
      }
    }

        ///INFRA iS CODE 
    stage('TF INICIAR') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('TF FMT') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('TF Apply') {
            steps {
          sh '''
          terraform apply -auto-approve
          '''

            }
        }


  stage('Deploy to S3') {
            steps {
                script {
                    def bucketName = 'mybucketjenkinslast'
                    def sourceDir = './web'
                    
                    // Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
                }
            }
        }
    }
    }