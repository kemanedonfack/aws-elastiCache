pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the source code...'
                 //git 'https://gitlab.sif.saicdevops.com/nadeshn/elasticache_iac.git'
            }
        }


        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }

    }
}
