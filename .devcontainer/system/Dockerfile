FROM debian:12

ARG PROJECT_PATH=/workspace

COPY ./tools/* /tmp/

RUN chmod +x /tmp/entrypoint.sh

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    ca-certificates \
    zsh \
    coreutils \
    $(cat /tmp/packages.txt | xargs) \
    && rm -rf /var/lib/apt/lists/*

RUN chsh -s $(which zsh) root
RUN mkdir -p ${PROJECT_PATH}
WORKDIR ${PROJECT_PATH}