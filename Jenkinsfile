pipeline {
    
    agent any
    
    stages {
        
         stage('Deploy on elastiCache') {
           steps {
                  sh 'cat ~/.aws/credentials'             
                  sh 'terraform init' 
                  sh 'terraform plan' 
                  sh 'terraform apply --auto-approve'                
           }
        }
               
    }
}
