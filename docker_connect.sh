#!/bin/bash

set -e
set -x
set -o pipefail

sudo apt update
sudo apt install docker.io -y
sudo apt install awscli -y

sudo systemctl start docker
sudo systemctl enable docker

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 503510385200.dkr.ecr.us-east-1.amazonaws.com

docker pull nginx:stable-alpine3.23-perl
docker tag nginx:stable-alpine3.23-perl 503510385200.dkr.ecr.us-east-1.amazonaws.com/my_repository_nikita_2026:latest

docker push 503510385200.dkr.ecr.us-east-1.amazonaws.com/my_repository_nikita_2026:latest


