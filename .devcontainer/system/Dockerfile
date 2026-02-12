FROM debian:12

ARG WORKDIR=/workspace

COPY ./tools/* /tmp/
RUN chmod +x /tmp/entrypoint.sh

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    git \
    ca-certificates \
    zsh \
    coreutils \
    gnupg \
    lsb-release \
    $(cat /tmp/packages.txt | xargs) \
    && rm -rf /var/lib/apt/lists/*

RUN chsh -s $(which zsh) root

# Configuration de zsh
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
	mv /tmp/.zshrc /root/.zshrc

RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}
