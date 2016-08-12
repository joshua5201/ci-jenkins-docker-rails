FROM ubuntu:latest
MAINTAINER Tsung-en Hsiao <joshua841025@gmail.com>

RUN locale-gen en_US.UTF-8
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl git openssh-server openjdk-8-jre-headless sudo nodejs gnupg libyaml-dev imagemagick 

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8

RUN mkdir /var/run/sshd
RUN useradd -m jenkins
RUN echo "jenkins:jenkins" | chpasswd
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/apt-get" >> /etc/sudoers

USER jenkins
RUN mkdir /home/jenkins/.rvm
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"'  >> /home/jenkins/.bashrc

RUN mkdir /home/jenkins/workspace

USER root
EXPOSE 22
