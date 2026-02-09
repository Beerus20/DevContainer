#! /bin/bash

# Cloner seulement si le dossier est vide
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv /tmp/.zshrc /root/.zshrc
git clone $PROJECT_REPO $PROJECT_PATH