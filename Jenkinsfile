pipeline {
  agent any
  parameters {
    choice(
        name: 'Action',
        choices: "apply\ndestroy",
        description: 'Apply or Destroy the instance' )
  }
  stages {

    stage('Checkout') {
        steps {
            git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:amadinathaniel/nginx-jenkins-ansible-terraform.git'
        }
    }

    stage('Terraform') {
      steps {
        script {
          if (params.Action == "apply") {
            sh 'terraform -chdir=terraform/static-site init'
            sh 'terraform -chdir=terraform/static-site apply' // -var "name=hello" -var "group=web" -var "region=eu-west-2" -var "profile=DevOpsUser" --auto-approve terraform/static-site'
          } 
          else {
            sh 'terraform -chdir=terraform/static-site destroy' // -var "name=hello" -var "group=web" -var "region=eu-west-2" -var "profile=DevOpsUser" --auto-approve terraform/static-site'
          }
        }
      }
    }

    stage('Ansible') {
      steps {
        retry(count: 5) {
          sh 'ansible-playbook -i /etc/ansible/aws_ec2.yaml ansible/static-site/site.yaml'
        }
      }
    }
  }
}