pipeline {
    
    agent any
    
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
