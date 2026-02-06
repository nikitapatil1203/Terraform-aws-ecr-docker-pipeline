#!/bin/bash

set -e
set -x
set -o pipefail

sudo apt update -y
sudo apt install docker.io -y
sudo apt install -y unzip

#install aws-cli
curl -fsSL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install


sudo systemctl start docker
sudo systemctl enable docker

sudo docker pull nginx:stable-alpine3.23-perl

aws ecr get-login-password --region us-east-1 |sudo docker login --username AWS --password-stdin 503510385200.dkr.ecr.us-east-1.amazonaws.com

sudo docker tag nginx:stable-alpine3.23-perl 503510385200.dkr.ecr.us-east-1.amazonaws.com/my_repository_nikita_2026:latest

sudo docker push 503510385200.dkr.ecr.us-east-1.amazonaws.com/my_repository_nikita_2026:latest


