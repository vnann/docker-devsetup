#!/bin/bash

#
# Purpose:  Installs minikube, kubectl, kubectx, kubens and sets up the docker-env to minikube
#

# Uninstall old docker verion
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# install docker-ce
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# sudo dnf repolist -v
# To list all available docker-ce packages 
# dnf list docker-ce --showduplicates | sort -r

sudo yum install docker-ce docker-ce-cli containerd.io  -y

sudo systemctl start docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
systemctl status docker
docker -v

# Install curl
sudo dnf install curl -y

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

#by default minikube uses docker driver for VM Driver.

# install minikube
echo "Intalling minikube...."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo "kubectl install completed...."
# Check the status of the minikube
minikube status
minikube start
minikube status

# install kubectl
echo "Intalling kubectl...."

curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "kubectl install completed...."
kubectl version

# install kubectx and kubens
# these two files help with Context and Namespace switching easy

echo "Installing kubectx and kubens...."

wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens
chmod +x kubectx kubens
sudo mv kubens kubectx /usr/local/bin

echo "kubectx and kubens install completed..."

echo "docker env set to minikube docker..."

# Set docker env to use minikube docker
eval $(minikube docker-env) 

# Set auto complete for zsh

echo "setting kubectl auto complet for zsh..."
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell

# To see which driver the minikube is using run below command

minikube profile list
