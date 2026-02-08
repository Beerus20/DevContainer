FROM debian:12

ARG USER=dev

COPY ./packages.txt /tmp/packages.txt
COPY ./entrypoint.sh /tmp/entrypoint.sh
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

RUN useradd -ms /bin/zsh $USER
RUN mkdir -p /home/$USER/workspace
RUN mkdir -p /tmp/project
RUN chown -R $USER:$USER /home/$USER

WORKDIR /home/$USER/workspace
