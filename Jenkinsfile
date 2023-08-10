pipeline {
    
    agent any

    tools {
        terraform 'terraform'
    }
    
    stages {
        
         stage('Deploy on ecs') {
           steps {
               dir('terraform'){             
                  sh 'terraform init' 
                 sh ("terraform plan -var='access_key=${AWS_ACCESS_KEY_ID}' -var='secret_key=${AWS_SECRET_ACCESS_KEY}' -var='container_tag=${gitCommit}' ")
                 sh ("terraform apply -var='access_key=${AWS_ACCESS_KEY_ID}' -var='secret_key=${AWS_SECRET_ACCESS_KEY}' -var='container_tag=${gitCommit}' --auto-approve")
               }
           }
        }
               
    }
}
