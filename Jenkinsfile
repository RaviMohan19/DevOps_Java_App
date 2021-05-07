pipeline {
    agent {
        node {
            label 'staging'
        }
    }
    
    parameters {
       string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    
    stages {
        stage('Environment variables') {
            steps {
                sh '''
                   #!/bin/bash
                   printenv
                   echo "Sample Text File Modified" > sample.txt
                   '''
                   echo "${params.PERSON}"
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
                   if [ find * | grep build ]; then
                      rm -rf build
                   fi
                   git clone https://github.com/kavithadevops1986/DevOps_Java_App.git build
                   cd build
                   java welcomeFile
               '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
       
        success {
            echo "${JOB_NAME} is successful"
            emailext (to: 'ravim.boggula@gmail.com', subject: "${JOB_NAME}", body: "${JOB_NAME}_${BUILD_NUMBER}",recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }

        failure {
            echo "${JOB_NAME} is successful"
            emailext (to: 'ravim.boggula@gmail.com', subject: subject, body: "${JOB_NAME}_${BUILD_NUMBER}",recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }

        unstable {
            echo "${JOB_NAME} is unstable"
            emailext (to: 'ravim.boggula@gmail.com', subject: subject, body: "${JOB_NAME}_${BUILD_NUMBER}",recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }

        aborted {
            echo "${JOB_NAME} is successful"      
            emailext (to: 'ravim.boggula@gmail.com', subject: subject, body: "${JOB_NAME}_${BUILD_NUMBER}",recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }   
    }
}
