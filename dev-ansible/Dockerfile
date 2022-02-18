# Development environment for Ansible
#FROM ubuntu:latest
FROM debian:bullseye-slim

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3:/home/devuser/.local/bin
ENV RUNNING_IN_DOCKER true
ENV LANG en_US.utf8

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y \
	tzdata \
    	vim \
	dialog \
    	sudo \
    	curl \
    	git-core \
    	gnupg \
    	python3 python3-pip python3-venv \
    	zsh \
    	wget \
    	unzip \
    	openssl \
    	fonts-powerline \
    	dos2unix \
    	figlet \
    	ca-certificates \
    	apt-transport-https \
    	lsb-release \
	dnsutils \
    && adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser  \
    && echo "devuser:p@ssword1" | chpasswd && usermod -aG sudo devuser 

USER devuser
WORKDIR /home/devuser

RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

COPY requirements.txt .
COPY zshrc /home/devuser/.zshrc
COPY vimrc /home/devuser/.vimrc
USER root
RUN chown devuser:devuser /home/devuser/.zshrc \
    && chown devuser:devuser /home/devuser/.vimrc
USER devuser
RUN python3 -m pip install -r requirements.txt

CMD ["zsh"]

