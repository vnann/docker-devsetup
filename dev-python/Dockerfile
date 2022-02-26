# Development environment for Python3
#FROM ubuntu:latest
FROM debian:bullseye-slim

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3:/home/devuser/.local/bin
ENV RUNNING_IN_DOCKER true

ARG UID=1001
ARG GID=1001
ARG USERNAME=devuser

RUN apt-get update \
    && apt-get install -y \
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
    && groupadd --gid $GID -o $USERNAME \
    #&& adduser -u $UID -g $GID --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" $USERNAME  \
    && adduser --uid $UID --gid $GID  --quiet --disabled-password --shell /bin/zsh --home /home/$USERNAME --gecos "User"  $USERNAME  \
    && echo "devuser:p@ssword1" | chpasswd && usermod -aG sudo $USERNAME

# https://boxboat.com/2017/07/25/fixuid-change-docker-container-uid-gid/
# Used the code from above website to fix the user permission issues. 
RUN USER=devuser && \
    GROUP=devuser && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.1/fixuid-0.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml
ENTRYPOINT ["fixuid"]

USER $USERNAME
WORKDIR /home/$USERNAME

RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

COPY requirements.txt .
COPY zshrc /home/devuser/.zshrc
COPY vimrc /home/devuser/.vimrc
USER root
RUN chown $USERNAME:$USERNAME /home/$USERNAME/.zshrc \
    && chown $USERNAME:$USERNAME /home/$USERNAME/.vimrc \
    && usermod -u $UID -o  $USERNAME \
    && groupmod -g $UID $USERNAME
USER $USERNAME

RUN python3 -m pip install -r requirements.txt

CMD ["zsh"]
