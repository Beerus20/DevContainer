#! /bin/bash

if [ ! -f /tmp/.initialized ]; then
	touch /tmp/.initialized

	# Configuration de zsh
	yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	mv /tmp/.zshrc /root/.zshrc
	
	# Install nvm, Node.js, npm, and pnpm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24
	node -v
	npm -v
	wget -qO- https://get.pnpm.io/install.sh | ENV="/root/.zshrc" SHELL="$(which zsh)" zsh -
	source /root/.zshrc

	# Cloner seulement si le dossier est vide
	if [ -n "$PROJECT_PATH" ] && [ -z "$(ls -A $PROJECT_PATH)" ]; then
		git clone $PROJECT_REPO $PROJECT_PATH
	fi
fi
