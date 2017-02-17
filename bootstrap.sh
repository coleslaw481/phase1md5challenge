#!/usr/bin/env bash

echo "Installing base packages"

yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel python-wheel yum-utils python-devel epel-release

yum-config-manager --add-repo  https://docs.docker.com/engine/installation/linux/repo_files/centos/docker.repo

yum makecache fast

yum -y install docker-engine python2-pip openssl openssl-devel

systemctl start docker
systemctl enable docker

usermod -aG docker vagrant 

pip install urllib3[secure]
pip install cwl-runner

