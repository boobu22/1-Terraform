pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"  // disables colored output and prompts
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/boobu22/1-Terraform.git']]
                ])
            }
        }

      stage('Terraform Init') {
    steps {
        sh 'terraform init -input=false -force-copy'
    }
}

        stage('Terraform Validate') {
            steps {
                echo "Terraform action is --> validate"
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Terraform action is --> plan"
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo "Terraform action is --> apply"
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo '✅ Terraform pipeline executed successfully.'
        }
        failure {
            echo '❌ Terraform pipeline failed.'
        }
    }
}
