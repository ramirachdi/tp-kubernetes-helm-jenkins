pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ramirachdi/mon-app:latest'
    }

    stages {
        stage('Cloner le dépôt') {
            steps {
                git 'https://github.com/ramirachdi/tp-kubernetes-helm-jenkins.git'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    echo "Construction de l'image Docker..."
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Pousser l\'image Docker') {
            steps {
                script {
                    echo "Connexion à Docker Hub..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh "docker push $DOCKER_IMAGE"
                        sh "docker logout"
                    }
                }
            }
        }

        stage('Déployer sur Kubernetes') {
            steps {
                script {
                    echo "Déploiement de l'application sur Kubernetes..."
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
