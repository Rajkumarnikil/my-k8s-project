pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rajkumarnikil/my-k8s-project.git']])
            }
        }
        stage('maven build'){
            steps{
                sh '/opt/maven/bin/mvn clean package'
                sh 'mv target/myweb*.war target/newapp.war'
            }
        }
        stage('docker build'){
            steps{
                sh 'docker build -t newapp:latest .'
                sh 'docker tag newapp:latest rajkumarchinnasamy/newapp:latest'
                sh 'docker tag newapp:latest rajkumarchinnasamy/newapp:${BUILD_NUMBER}'
            }
        }
        stage('dockerpush'){
            steps{
   withCredentials([string(credentialsId: '123pass', variable: 'password')]) {
    // some block
}
            sh 'docker push --all-tags rajkumarchinnasamy/newapp'
            }
        }
        stage('deploy to eks'){
            steps{
                sh 'kubectl apply -f ./main.yml'
            
                
            }
        }
    }
}
