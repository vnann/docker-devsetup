# Development environment for Python3
FROM debian:bullseye-slim

ARG USERNAME=devuser

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3:/home/$USERNAME/.local/bin
ENV RUNNING_IN_DOCKER true

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
		iputils-ping \
		netcat \
		net-tools \
		iproute2 \
    && adduser  --quiet --disabled-password --shell /bin/zsh --home /home/$USERNAME --gecos "User"  $USERNAME  \
    && echo "devuser:p@ssword1" | chpasswd && usermod -aG sudo $USERNAME

WORKDIR /root

RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

COPY requirements.txt .
COPY zshrc /root/.zshrc
COPY vimrc /root/.vimrc

RUN python3 -m pip install -r requirements.txt

CMD ["zsh"]
