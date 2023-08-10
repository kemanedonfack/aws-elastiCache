pipeline {
    
    agent any

    tools {
        terraform 'terraform'
    }
    
    stages {
        
         stage('Deploy on ecs') {
           steps {           
                  sh 'terraform init' 
                  sh 'terraform plan' 
                  sh 'terraform apply'                
           }
        }
               
    }
}
