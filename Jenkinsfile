pipeline {
  agent {
    kubernetes {
      yamlFile 'kubepod.yaml'
    }
  }
    stages {  
    stage('Build app') {
      steps {
        container('dind') {
          sh 'echo MAVEN_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}'
          sh 'ls -al'
          // sh 'dockerd &'
          withCredentials([usernamePassword(credentialsId: 'dockerreg', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
            sh ''' docker login teopocregistery.azurecr.io -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
            docker build . -t teopocregistery.azurecr.io/reactsample:0.0.1
            docker push teopocregistery.azurecr.io/reactsample:0.0.1 '''
          }
        }
      }
    }
  }
}