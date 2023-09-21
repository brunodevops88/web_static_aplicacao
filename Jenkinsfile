pipeline{
    agent any 
    environment {
    AWS_DEFAULT_REGION = "us-east-1"
    THE_BUTLER_SAYS_SO = credentials('awscredential')
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
                    def sourceDir = '*'
                    
                    // Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
                }
            }
        }
    }
}