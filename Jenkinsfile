pipeline {
    agent {
        node {
            label 'master'
        }
    }
    
    stages {
        stage('Environment variables') {
            steps {
                sh '''
                   #!/bin/bash
                   printenv
                   echo "This is a sample text file" > sample.txt
                '''
            }
        }
        
        stage('Push Artifacts') {
            steps {
                sh '''
                   #!/bin/bash
                   echo "Workspace is : ${WORKSPACE}"
                '''
                archiveArtifacts artifacts: "*.txt", followSymlinks: false 
            }
        }
    }
}
