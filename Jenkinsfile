pipeline{
    agent any
    environment{
         GITHUB_TOKEN = credentials('GITHUB_TOKEN')
    }
    stages{
        stage('Clone repo'){
            steps{
                sh '''
                git clone https://github.com/alsmk/CI-CD_tasks.git
                cd CI-CD_tasks/
                pip install -r requirements.txt
                echo "TOKEN=$GITHUB_TOKEN" > .env 
                python ./scripts/fetch_info.py
                '''
            }
            
        }
       
        
    }
    post{
        always{
            cleanWs()
        }
    }

}