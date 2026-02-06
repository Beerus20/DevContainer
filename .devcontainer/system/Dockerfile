FROM debian:12

ARG USER=dev
ARG USER_UID=1000
ARG USER_GID=1000

COPY ./packages.txt /tmp/packages.txt

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    ca-certificates \
    zsh \
    $(cat /tmp/packages.txt | xargs) \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $USER_GID $USER
RUN useradd -ms /bin/zsh -u $USER_UID -g $USER_GID $USER
#RUN chown -R $USER_UID:$USER_GID /home/$USER
RUN mkdir -p /home/$USER/workspace
WORKDIR /home/$USER/workspace