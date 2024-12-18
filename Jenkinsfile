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
        stage('fetching-info'){
            steps {
                // git branch: 'main', url: 'https://github.com/alsmk/CI-CD_tasks.git'
                
                sh '''
                python3 -m venv env
                . ./env/bin/activate 
                pip install -r requirements.txt
                echo "TOKEN=$GITHUB_TOKEN" > .env 
                python ./scripts/fetch_info.py
                '''
            

            }
        }
        stage('test results'){
            steps{
                sh '''
                python3 -m venv env
                . ./env/bin/activate 
                pip install -r requirements.txt
                echo "TOKEN=$GITHUB_TOKEN" > .env 
                python ./scripts/test.py
                '''
            }
        }
        
  
           


    }
    

}