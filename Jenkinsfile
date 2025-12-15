pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonarqube-token')
        SONAR_HOST_URL = 'http://192.168.56.10:30090'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                sh """
                mvn sonar:sonar \
                  -Dsonar.projectKey=student-management \
                  -Dsonar.host.url=$SONAR_HOST_URL \
                  -Dsonar.login=$SONAR_TOKEN
                """
            }
        }

        stage('Docker build & push') {
            steps {
                echo 'Docker build & push (déjà validé dans TP précédent)'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                  kubectl apply -f k8s/
                  kubectl get pods
                  kubectl get svc
                '''
            }
        }
    }
}
