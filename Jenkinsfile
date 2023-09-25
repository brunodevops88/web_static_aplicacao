pipeline {
  agent any
  environment {
    AWS_DEFAULT_REGION="us-east-1"
    THE_BUTLER_SAYS_SO=credentials('aws-creds')
    SNYK_API_TOKEN = credentials('snyk-api-token')
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


    stage('SonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=SITEWEB -Dsonar.organization=brunosantos881388 -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=e21cbff0bf1b8610f6e2b2d9b07f89a9d829c4bb'
			}
        } 

    stage('Scan') {
        snykSecurity organisation: 'BrunoSantos88', projectName: 'SITEWEB', severity: 'medium', snykInstallation: 'Snyk', snykTokenId: '5eb9608a-586d-4198-b5e6-70a76a352200', targetFile: 'package.json'
    }
    }

    // InfraIsCode

    stage('Teste AWS') {
      steps {
        sh '''
          aws --version
          aws ec2 describe-instances
        '''
      }
    }

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
                   def bucketName = 'my-static-website-frontendv1'
                  def sourceDir = './web'
                    
              ///Use the AWS CLI to sync the files to S3
                    sh "aws s3 sync ${sourceDir} s3://${bucketName}/"
               }
            }
}
}