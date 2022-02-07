FROM ubuntu:latest

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3

RUN apt-get update \
    && apt-get install -y \
    vim \
    sudo \
    curl \
    git-core \
    gnupg \
    locales \
    python3 python3-pip python3-venv \
    zsh \
    wget \
    unzip \
    openssl \
    fonts-powerline \
    dos2unix \
    && locale-gen en_US.UTF-8 \
    && bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

RUN mkdir /home/devuser
WORKDIR /home/devuser

COPY requirements.txt .
COPY .zshrc /root
COPY .vimrc /root
RUN python3 -m pip install -r requirements.txt

