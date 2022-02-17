#!/bin/bash

#
# Purpuser: Installs docker-ce docker-ce-cli containterd.io curl docker-comose
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
