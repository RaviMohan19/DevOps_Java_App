pipeline {
    agent {
        node {
            label 'staging'
        }
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    sh '''
                        #!/bin/bash
                        if [ -d "${WORKSPACE}/build" ]
                        then
                            echo "Build Directory Exists"
                            rm -rf build
                        else 
                            echo "Directory not found, Deleting not necessary"
                        fi 
                        git clone https://github.com/kavithadevops1986/DevOps_Java_App.git build
                        cd ${WORKSPACE}/build
                        ls -la
                        jar cvf helloWorld.war *
                    '''
                }
            }
        } // Build
       
        stage('Deploy') {
            steps {
                script {
                    sh '''
                        #!/bin/bash
                        cp ${WORKSPACE}/build/helloWorld.war /opt/tomcat/webapps/.
                    '''
                }
            }
        } //Deploy       
    } // stages
    post {
        always {
            cleanWs()
        }
        failure {
            echo "${JOB_NAME} Pipeline failed" 
        }
        success {
            echo "${JOB_NAME} Pipeline Successful"
        }
    }
} // pipeline

