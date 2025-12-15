pipeline {
  agent any

  environment {
    IMAGE = "eyajm/student-management-app:latest"
    SONAR_URL = "http://192.168.56.10:30090"
  }

  stages {

    stage('Build (Maven)') {
      steps {
        sh '''
          chmod +x mvnw || true
          ./mvnw clean package -DskipTests
        '''
      }
    }

    stage('Docker build') {
      steps {
        sh '''
          docker build -t $IMAGE .
        '''
      }
    }

    stage('Docker push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-eya', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push $IMAGE
          '''
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh '''
          kubectl apply -f k8s/

          echo "Pods après déploiement :"
          kubectl get pods

          echo "Services après déploiement :"
          kubectl get svc
        '''
      }
    }

    stage('Analyse SonarQube') {
      steps {
        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
          sh """
            ./mvnw sonar:sonar \
              -Dsonar.projectKey=student-management \
              -Dsonar.host.url=$SONAR_URL \
              -Dsonar.login=$SONAR_TOKEN
          """
        }
      }
    }
  }
}
