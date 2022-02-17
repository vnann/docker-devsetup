#!/bin/bash


#
# Purpose: Installs minikube, kubectl, kubectx, kubens and sets up the docker-env to minikube
#

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

echo  "Installing azure cli and azure aks cli...."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

sudo dnf install azure-cli

az aks install-cli


echo "Azure cli and aks cli install completed...."
