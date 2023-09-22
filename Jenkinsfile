pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('CredentialID')
        AWS_SECRET_ACCESS_KEY = credentials('SecretAccessKey')
        AWS_DEFAULT_REGION = 'us-east-1'


    }
    stages {
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
                    def sourceDir = '*/web'
                    
                    // Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
                }
            }
        }
    }
}