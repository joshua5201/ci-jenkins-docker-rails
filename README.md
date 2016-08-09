# CI Installation

## Requirement
1. Docker
2. Jenkins

## Prepare Docker Image
1. Pull image: `docker pull joshua5201/jenkins-slave-rails`
2. Create volume for RVM: `docker volume create --name rvm`
3. Install RVM in docker: `sudo docker run -v rvm:/home/jenkins/.rvm -it joshua5201/jenkins-slave-rails /bin/bash`
4. Inside docker: 
    - `su -l jenkins`
    - `curl -sSL https://get.rvm.io | bash -s stable`
5. After this, when using other dockers based on mine, you only need to mount rvm on it. (by `-v rvm:/home/jenkins/.rvm`)

## Jenkins Configuration
1. Follow the default steps and create first administrator user
2. Manage jenkins -> Manage plugins -> Available -> install docker, RVM
3. Manage jenkins -> Configure system -> Add a new cloud (choose docker) ref: [https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin)
    - set name, docker url
    - Add docker template
    - Docker image: joshua5201/jenkins-slave-rails
    - Container settings -> Volumes: rvm:/home/jenkins/.rvm
    - Remote Filing System Root: /home/jenkins
    - Labels: docker
    - Add Credentials -> username with password -> jenkins/jenkins

## Create Job
1. New Item -> Enter name -> Choose freestyle item
2. Restrict where this project can be run: docker (or whatever labels you set for dockers)
3. Source Code Management: git -> set repo url -> add credentials (ssh private key with username 'git')
4. Build Environment: Run the build in a RVM-managed environment -> choose your implementation 
5. Add build steps: Execute shell 
``` bash
gem install bundler
bundle install
bundle exec rake db:test:prepare
bundle exec rake
```

## Troubleshooting
1. If any packages are needed to be install, email: joshua841025@gmail.com or fork my Dockerfile on dockerhub.
