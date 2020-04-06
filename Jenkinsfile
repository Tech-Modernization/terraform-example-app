def default_env = [
    'TF_IN_AUTOMATION=true',
    'OUT_FILE=tfplan',
    'AWS_DEFAULT_REGION=us-east-1'
]

def branch_mapping = [
    '^v(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)?\$': [
        'ROOT_DIR=./envs/release'
    ],
    'master': [
        'ROOT_DIR=./envs/master'
    ]
]

node {
    checkout scm

    docker.build("build-env", "./jenkins").inside('--rm --entrypoint=""') {
        withCredentials([
            string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
            withEnv(default_env + ['ROOT_DIR=./envs/feature']) {
                ApplyAndDestroy()
            }

            if ((env.BRANCH_NAME =~ '^v(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)?\$').matches()) {
                 withEnv(default_env + ['ROOT_DIR=./envs/release']) {
                    Apply()
                }
            } else if ((env.BRANCH_NAME =~ 'master').matches()) {
                withEnv(default_env + ['ROOT_DIR=./envs/master']) {
                    Apply()
                }
            }
        }
    }
}

def Plan() {
    stage('Format Test') {
        sh 'make fmt-test'
    }
    stage('Init') {
        sh 'make init'
    }
    stage('Init Test') {
        sh 'make init-test'
    }
    stage('Plan') {
        sh 'make plan'
    }
    stage('Plan Test') {
        sh 'make plan-test'
    }
}

def Apply() {
    Plan()
    stage('Apply') {
        sh 'make apply'
    }
    stage('Apply Test') {
        sh 'make apply-test'
    }
}

def ApplyAndDestroy() {
    try {
        Apply()
    } finally {
        stage('Destroy') {
            sh 'make destroy'
        }
    }
}


