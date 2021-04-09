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

        stage('Build') {
            steps {
               // Here compiling the welcome java file
               sh '''
                   #!/bin/bash
                   git clone https://github.com/kavithadevops1986/DevOps_Java_App.git build
                   java "${WORKSPACE}"/build/welcomeFile
               '''
            }
        }
    }
}
