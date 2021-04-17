#!/bin/bash
# curl (REST API)
# Assuming "anonymous read access" has been enabled on your Jenkins instance.
JENKINS_URL="http://c3af835f5a1c.mylabserver.com:8080"
# JENKINS_CRUMB is needed if your Jenkins controller has CRSF protection enabled as it should
JENKINS_CRUMB=`curl "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)"`
curl -X POST -H $JENKINS_CRUMB -F "jenkinsfile=<Jenkinsfile" $JENKINS_URL/pipeline-model-converter/validate
