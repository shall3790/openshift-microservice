
properties([pipelineTriggers([[$class: 'GitHubPushTrigger']])])
// 8
pipeline {
    agent any; 

    environment {
        APP_NAME = "dotnetcore-ex" 
    }

    stages {
        // stage('env') {
        //     steps {
        //         sh 'printenv';
        //     }
        // }

        stage('checkout') {
            steps {
                script {
                    sh "echo ${env.BRANCH_NAME}"
                    sh "printenv"
                    // checkout([$class: 'GitSCM', branches: [[name: 'v1.0.0-jenkins']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'svc_jenkins', url: 'http://hlgithub.hobbylobby.corp/HobbyLobby/HobbyLobby.OpenIdClient.git']]])
                    // // grab branch name
                    // gitBranch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
                    // sh "echo Start Jenkins Pipeline script for branch: ${gitBranch}"
                }
            }
        }
        
        stage('build') {
            steps {
                script {
                    def buildImg = "hlrepomgmt01:8088/dotnet/dotnet-21-rhel7"
                    sh "echo build step..."
                    // def buildDir = sh(returnStdout: true, script: 'pwd').trim();
                    // sh "echo building in local dir:  ${buildDir}"; 
                    // // removed options --workdir /opt/app-root/src --name ${env.APP_NAME}-build
                    // // we'll use root for the build
                    // sh "docker run -t --rm -u root -v ${buildDir}:/opt/app-root/src  ${buildImg} bash -c \"rm -fr bin && dotnet restore && dotnet publish -c Release -o out\""
                }
            }
        }

        stage('test') {
            steps {
                script {
                    sh "echo unit tests..."
                }
            }
        }

        // stage('nexus-policy') {
        //     steps {
        //         script {
        //             nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'HobbyLobby.OpenIdClient', iqScanPatterns: [[scanPattern: '**/*.nupkg']], iqStage: 'build', jobCredentialsId: ''
        //             // nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'HobbyLobby.OpenIdClient', iqStage: 'build', jobCredentialsId: ''
        //         }
        //     }
        // }

        // stage('deploy') {
        //     steps {
        //         script {
        //             sh "echo deploy step..."
        //             def gitCommitHash = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        //             sh "echo running deploy for app: ${env.APP_NAME}, branch: ${env.BRANCH_NAME}"
        //             // 
        //             switch(env.BRANCH_NAME) {
        //                 case "develop":
        //                     // build dev container
        //                     sh "docker build -t ${env.APP_NAME}:dev-${gitCommitHash} -t ${env.APP_NAME}:dev-latest ."
        //                     // stop old dev container
        //                     sh "docker stop ${env.APP_NAME}-dev || true"
        //                     // start new dev container
        //                     sh "docker run -d --rm --name ${env.APP_NAME}-dev -p 5077:5000 ${env.APP_NAME}:dev-latest"
        //                     break;
        //                 case "master":
                            
        //                     break;    
        //                 default:
        //                     sh "echo -- no branch found for artifact deployment"
        //                     break
        //             }
        //             // push to nuget
        //             // sh "docker run -t --rm -v ${buildDir}:/app --workdir /app --name ${APP_NAME}-nuget-push microsoft/aspnetcore-build:2.0 bash -c \"dotnet nuget push -s http://hlrepomgmt01.hobbylobby.corp:8081/repository/hl-nuget/ -k 6dc27f90-d061-3035-8448-9e59086b43b6 bin/Debug/HobbyLobby.OpenIdClient.1.0.0-rc1.nupkg\""
        //         }
        //     }
        // }
        // stage('dev-deploy') {
        //     // dev sandbox release
        //     when { branch "develop" } 
        //     steps {
        //         script {
        //             def gitCommitHash = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        //             sh "echo running deploy for app: ${env.APP_NAME}, branch: ${env.BRANCH_NAME}"
        //             // build dev container
        //             sh "docker build -t ${env.APP_NAME}:dev-${gitCommitHash} -t ${env.APP_NAME}:dev-latest ."
        //             // stop old dev container
        //             sh "docker stop ${env.APP_NAME}-dev || true"
        //             // start new dev container
        //             sh "docker run -d --rm --name ${env.APP_NAME}-dev -p 5077:5000 ${env.APP_NAME}:dev-latest"
        //         }
                
        //     }
        // }

        // stage('release-deploy') {
        //     // release sandbox deployment
        //     when { branch "release/*" }
        //     steps {
        //         script {
        //             def relVer = sh(returnStdout: true, script: 'echo ${BRANCH_NAME/release\\//}').trim()
        //             // build dev container
        //             sh "docker build -t ${env.APP_NAME}:staging-${relVer} -t ${env.APP_NAME}:staging-latest ."
        //             // stop old dev container
        //             sh "docker stop ${env.APP_NAME}-staging || true"
        //             // start new dev container
        //             sh "docker run -d --rm --name ${env.APP_NAME}-staging -p 5088:5000 ${env.APP_NAME}:staging-latest"
        //         }
                
        //     }
        // }

        // stage('master-deploy') {
        //     // master 
        //     when { branch "master" }
        //     steps {
        //         script {
        //             def gitCommitHash = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        //             sh "echo running deploy for app: ${env.APP_NAME}, branch: ${env.BRANCH_NAME}"
        //             // build dev container
        //             sh "docker build -t ${env.APP_NAME}:master-${gitCommitHash} -t ${env.APP_NAME}:master-latest ."
        //             // stop old dev container
        //             sh "docker stop ${env.APP_NAME}-master || true"
        //             // start new dev container
        //             sh "docker run -d --rm --name ${env.APP_NAME}-master -p 5099:5000 ${env.APP_NAME}:master-latest"
        //         }
                
        //     }
        // }
    }
    
    post {
        always {
            echo 'finished'
        }
        success {
            echo 'succeeded'
        }
        unstable {
            echo 'unstable'
        }
        failure {
            echo 'failure '
        }
    }   
}
