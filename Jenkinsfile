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
        stage ('Deploy to S3'){ 
            steps{ 
                echo "Deploying" 
                sh ' aws s3 cp ./web s3://mybuckets3jenkins '
            } 
        }

    }
}