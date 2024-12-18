pipeline{
    agent any
    environment{
         GITHUB_TOKEN = credentials('GITHUB_TOKEN')
    }
    tool{
        python 'Python3'
    }
    stages{
        stage('Clone Repo'){
            steps {
                git branch: 'main', url: 'https://github.com/alsmk/CI-CD_tasks.git'
                

            }
        }
        stage('Install  Dependencies'){
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run the main task'){
            steps{
                sh '''
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