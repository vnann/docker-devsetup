# Development environment for Python3
#FROM ubuntu:latest
FROM debian:bullseye-slim

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3
ENV RUNNING_IN_DOCKER true

RUN apt-get update \
    && apt-get install -y \
    	vim \
    	sudo \
    	curl \
    	git-core \
    	gnupg \
    	locales \
    	python3 python3-pip python3-venv python3-dev \
	libpq-dev \
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
    && locale-gen en_US.UTF-8 \
    && adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser  \
    && echo "devuser:p@ssword1" | chpasswd && usermod -aG sudo devuser 

USER devuser
WORKDIR /home/devuser

RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

COPY requirements.txt .
COPY zshrc /home/devuser/.zshrc
COPY vimrc /home/devuser/.zshrc
USER root
RUN chown devuser:devuser /home/devuser/.zshrc \
    && chown devuser:devuser /home/devuser/.vimrc
USER devuser
RUN python3 -m pip install -r requirements.txt

CMD ["zsh"]
