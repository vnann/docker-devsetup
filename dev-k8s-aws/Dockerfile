# Development environment for Kubernetes
# Install kubectl, Kubectx, Kubens and aws
From debian:bullseye-slim

ENV TERM xterm
ENV ZSH_THEME gnzh
ENV PATH=$PATH:/usr/bin/python3:/home/devuser/.local/bin
ENV RUNNING_IN_DOCKER true

RUN apt-get update \
    && apt-get install -y \
	apt-utils \
	dialog \
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
        figlet \
        ca-certificates \
        apt-transport-https \
        lsb-release \
        dnsutils \
    && locale-gen en_US.UTF-8 \
    && locale-gen en_US.UTF-8 \
    &&  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip -q  awscliv2.zip \ 
    && chmod +x /aws/install \
    && /aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli \
    && adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser  \
    && echo "devuser:p@ssword1" | chpasswd && usermod -aG sudo devuser

USER devuser
WORKDIR /home/devuser

RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \ 
    && bash -c "$(curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl)" \
    && bash -c "$(wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx)" \
    && bash -c "$(wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens)" 


COPY requirements.txt .
COPY zshrc /home/devuser/.zshrc
COPY vimrc /home/devuser/.vimrc
USER root
RUN chown devuser:devuser /home/devuser/.zshrc \
    && chown devuser:devuser /home/devuser/.vimrc \ 
    && chmod +x /home/devuser/kubectl \
    && mv /home/devuser/kubectl /usr/local/bin/kubectl \
    && chmod +x /home/devuser/kubectx \
    && chmod +x /home/devuser/kubens \
    && mv /home/devuser/kubectx /usr/local/bin \
    && mv /home/devuser/kubens /usr/local/bin
USER devuser
RUN python3 -m pip install -r requirements.txt

CMD ["zsh"]

