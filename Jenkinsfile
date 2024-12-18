pipeline{
    agent {
        docker {
            image 'python:latest' 
        }
    }
    environment{
         GITHUB_TOKEN = credentials('GITHUB_TOKEN')
    }
    
    stages{
        stage('Clone Repo'){
            steps {
                git branch: 'main', url: 'https://github.com/alsmk/CI-CD_tasks.git'
                
                sh '''
                'pip install -r requirements.txt'
                echo "TOKEN=$GITHUB_TOKEN" > .env 
                python ./scripts/fetch_info.py
                '''
            

            }
        }
  
           


    }
    

}