pipeline {
  agent any
  stages{
    stage ('Git Clone') {
      steps{
        echo "SCM Project"
        git branch: '13.0', credentialsId: 'jenkins', url: 'https://github.com/vpolice3/schoolerp.git'
      }
    }
  }
}
