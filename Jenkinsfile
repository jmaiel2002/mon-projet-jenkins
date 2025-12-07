pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                // Normalement : mvn clean package
                sh 'echo "Stage BUILD : mvn clean package (simulé pour le TP)"'
            }
        }

        stage('Docker build & push') {
            steps {
                // Normalement : docker build + docker push
                sh '''
                  echo "Stage DOCKER : docker build -t <image> . (simulé pour le TP)"
                  echo "Stage DOCKER : docker push <image> (simulé pour le TP)"
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                  echo "Stage DEPLOY : kubectl apply -f k8s/"
                  kubectl apply -f k8s/

                  echo "Pods après déploiement :"
                  kubectl get pods

                  echo "Services après déploiement :"
                  kubectl get svc
                '''
            }
        }
    }
}
