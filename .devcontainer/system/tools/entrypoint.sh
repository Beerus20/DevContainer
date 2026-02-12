#! /bin/bash

# Cloner seulement si le dossier est vide
if [ -z "$(ls -A $WORKDIR)" ]; then
	git clone $PROJECT_REPO $WORKDIR
fi
