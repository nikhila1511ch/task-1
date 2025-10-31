pipeline{
    agent any
    environment{
      REPO_URL= "https://github.com/nikhila1511ch/task-1"
      WORK_DIR=''
      BRANCH_NAME='main'
      DOCKER_REPO="https://app.docker.com/accounts/nikhila1511/task-1"
     REPO_DIR=''
      DOCKER_USERNAME='nikhila1511'
      DOCKER_PASSWORD='Nikhila@1511'
      IMAGE_NAME ='httpd'
      IMAGE_TAG='latest'
      IMAGE=''
      TARGET_SERVER=
    stages{
        stage(check){
            script{
                try{
                if(fileexists($REPO_DIR)){
                    sh "git ls -la ${REPO_URL}"
                    echo "file  exists in the $REPO_URL"
                }else{
                    echo "file doesn't exists in $REPO_URL "
                }
                env.CHECK_STATUS ='SUCESS'
            }catch(exception e){
                env.CHECK_STATUS ='FAILED'
                error("failed to check the $REPO_URL:${e.getmessage}()")
            }
        }
            
    }
        stage(pull){
            script{
                try{
                if(codeexists(REPO_URL)){
                    echo "pulled latest version of the code from $REPO_URL to $WORK_DIR"
                    sh '''
                    git pull $REPO_URL
                    '''
                }else{
                    echo "cloned code from $REPO_URL and pulling latest version of the code to $WORK_DIR"
                    sh '''
                    git clone $REPO_URL
                    '''
                }
                env.PULL_STATUS ='SUCESS'
            }catch(exception e){
                env.PULL_STATUS ='FAILED'
                error("failed to pull the latest version from $REPO_URL:${e.getmessage}()")
            }
        }
    }
        
        stage(build){
            script{
                try{
                echo "builed docker image with $IMAGE_NAME and $IMAGE_TAG"{
                    sh '''
                    docker build -t${DOCKER_REPO}${IMAGE_NAME}:${IMAGE_TAG},returnstdout :true
                    '''
                }
                env.BUILD_STATUS ='SUCESS'
            }catch(exception e){
                env.BUILD_STATUS ='FAILED'
                error("failed to create docker image with $IMAGE_NAME and $IMAGE_TAG:${e.getmessage}()")
            }
        }
    }

        stage(run){
            script{
                try{
                echo " docker image was run with $IMAGE_NAME and $IMAGE_TAG"{
                    sh '''
                    docker run -it -d -p 8080:80 $IMAGE 
                    '''
                }
                env.RUN_STATUS ='SUCESS'
            }catch(exception e){
                env.RUN_STATUS ='FAILED'
                error("failed to run docker image with $IMAGE:${e.getmessage}()")
            }
        }         
    }

        stage(pushimagetorepository){
            script{
                try{
                echo " docker image was run with $IMAGE_NAME and $IMAGE_TAG"{
                    sh '''
                    docker   
                    '''
                }
                env.PUSH_STATUS ='SUCESS'
            }catch(exception e){
                env.PUSH_STATUS ='FAILED'
                error("failed to push  docker image to $DOCKER_REPO:${e.getmessage}()")
            }
        }
    }

        stage(deploy){
            script{
                try{
                echo " application deployed sucessfully in $TARGET_SERVER "{
                    sh '''
                    docker login -u $DOCKER-USERNAME -p $DOCKER_PASSWORD
                    docker push ${DOCKER_REPO}${IMAGE_NAME}:${IMAGE_TAG}
                    '''
                }
                env.DEPLOY_STATUS ='SUCESS'
            }catch(exception e){
                env.DEPLOY_STATUS ='FAILED'
                error("failed to deploy in $TARGET_SERVER:${e.getmessage}()")
            }
        }
    }
    post{
        always{
            script{
                def checkstatus =env.CHECK_STATUS?: not executed
                def pullstatus =env.PULL_STATUS?: not executed
                def buildstatus =env.BUILD_STATUS?: not executed
                def runstatus =env.RUN_STATUS?: not executed
                def pushstatus =env.PUSH_STATUS?: not executed
                def deploystatus =env.DEPLOY_STATUS?: not executed

            }
        }
    }
    }
}