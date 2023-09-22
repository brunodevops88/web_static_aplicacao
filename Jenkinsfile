pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-1"
    THE_BUTLER_SAYS_SO=credentials('aws-creds')
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

        stage ('Build'){
            steps {
                echo "Building stage"
            }
        }
        stage ('Test'){
            steps {
                echo "Testing stage"

            }
        }
  stage('Deploy to S3') {
            steps {
                script {
                    def bucketName = 'mybuckets3jenkins'
                    def sourceDir = './web'
                    
                    // Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
                }
            }
        }
    }
    }