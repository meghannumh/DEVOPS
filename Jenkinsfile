pipeline{
  environment {
    registry = "meghanahadimani/nodejs-app"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
    stages {
        stage('Build'){
           steps{
              script{
                sh 'npm install'
              }
           }
        }
        stage('Building image') {
            steps{
                script {
                  dockerImage = docker.build registry + ":latest"
                 }
             }
          }
          stage('Push Image') {
              steps{
                  script {
                       docker.withRegistry( '', registryCredential){
                       dockerImage.push()
                      }
                   }
                }
           }
           stage('Deploying into k8s'){
               steps{
                   withKubeConfig(caCertificate: '', clusterName: 'minikube', contextName: 'minikube', credentialsId: 'jenkins-token', namespace: 'default',
                   serverUrl: 'https://192.168.49.2:8443') {
                        sh 'kubectl apply -f deployment.yaml'
                                                            }
                }
                
                
            }
        
    }
}