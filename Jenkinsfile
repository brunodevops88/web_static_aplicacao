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
        nodejs "nodejs_8.10.0"
    }
  
stages {

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/SITEWEB.git', branch: 'main',
    credentialsId: 'jenkinsserver'
          }
  }

    stage('Install NodeJs') {
            steps {
                sh 'npm install'
                sh "npm init"
            }
        }

  stages{
    stage('SonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar-scanner Dsonar.organization=brunosantos881388 -Dsonar.projectKey=BrunoSantos88_SITEWEB -Dsonar.sources=. -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=e21cbff0bf1b8610f6e2b2d9b07f89a9d829c4bb'
			}
    }


  stage('Analyse Security Snyk') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
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