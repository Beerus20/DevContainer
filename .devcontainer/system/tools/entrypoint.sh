#! /bin/bash

# Cloner seulement si le dossier est vide
if [ -f "$(ls -A $WORKDIR)" ]; then
	git clone $PROJECT_REPO $WORKDIR
fi
