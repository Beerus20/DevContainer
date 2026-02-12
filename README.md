# DevContainer

Ce projet configure un environnement de développement conteneurisé avec Visual Studio Code Dev Containers.

## 📋 Vue d'ensemble

Ce Dev Container est basé sur Debian 12 et fournit un environnement de développement complet avec support graphique (X11), audio, et de nombreux outils de développement pré-installés.

## 🏗️ Structure

```
.devcontainer/
├── devcontainer.json          # Configuration principale du Dev Container
├── compose.yml                # Configuration Docker Compose
├── .env                       # Variables d'environnement
└── system/
    ├── Dockerfile            # Image Docker personnalisée
    └── tools/
        ├── entrypoint.sh     # Script de démarrage
        ├── packages.txt      # Liste des packages à installer
        └── .zshrc           # Configuration Zsh personnalisée
```

## 🔧 Configuration

### Variables d'environnement (.env)

- **WORKDIR** : `/workspace` - Répertoire de travail dans le container
- **PROJECT_PATH** : `../` - Chemin du projet sur l'hôte
- **PROJECT_REPO** : `git@github.com:Beerus20/FDF.git` - Dépôt Git à cloner
- **DISPLAY** : `:0` - Display X11 pour les applications graphiques

### Fonctionnalités principales

#### Support graphique (X11)
- Partage du socket X11 (`/tmp/.X11-unix`)
- Support GPU via `/dev/dri`
- Bibliothèques X11 complètes (libX11, libXext, libXrender, etc.)

#### Support audio
- Accès au périphérique audio (`/dev/snd`)
- Groupe audio ajouté au container
- Support SDL2 avec mixage audio (libsdl2-mixer)

#### Outils de développement installés

**Outils système :**
- Git + Git Flow
- Zsh avec Oh My Zsh (thème: bira)
- Valgrind (débogage mémoire)

**Compilateurs et build tools :**
- GCC / G++
- Make
- libbsd-dev

**Bibliothèques de développement :**
- SDL2 (libsdl2-dev)
- SDL2 Image (libsdl2-image-dev)
- SDL2 TTF (libsdl2-ttf-dev)
- SDL2 Mixer (libsdl2-mixer-dev)

**Bibliothèques graphiques :**
- libx11-6, libxext6, libxrender1
- libxtst6, libxi6, libxrandr2
- libxcursor1, libxdamage1, libxfixes3, libxcomposite1

## 🚀 Utilisation

### Prérequis

- Docker
- Visual Studio Code
- Extension "Dev Containers" pour VS Code

### Démarrage

1. Ouvrez le dossier dans VS Code
2. Cliquez sur le bouton en bas à gauche (icône `><`)
3. Sélectionnez "Reopen in Container"

Le container se construira automatiquement et :
- Installera tous les packages nécessaires
- Configurera Zsh avec Oh My Zsh
- Clonera le dépôt Git si le workspace est vide (via `entrypoint.sh`)

### Configuration réseau

Le container utilise `network_mode: host`, ce qui signifie qu'il partage la stack réseau de l'hôte.

### Personnalisation

#### Ajouter des packages

Le fichier [.devcontainer/system/tools/packages.txt](.devcontainer/system/tools/packages.txt) contient la liste des packages Debian à installer automatiquement lors de la construction du container.

**Format :** Un package par ligne (sans virgules ni espaces supplémentaires)

**Packages actuellement installés :**
```
libx11-6              # Bibliothèque X11 de base
libxext6              # Extensions X11
libxrender1           # Rendu X11
libxtst6              # Test d'extensions X11
libxi6                # X11 Input extension
libxrandr2            # X11 RandR extension
libxcursor1           # Support curseur X11
libxdamage1           # X11 Damage extension
libxfixes3            # X11 Fixes extension
libxcomposite1        # X11 Composite extension
libsdl2-dev           # Simple DirectMedia Layer 2
libsdl2-image-dev     # SDL2 - support d'images
libsdl2-ttf-dev       # SDL2 - support de polices TrueType
libsdl2-mixer-dev     # SDL2 - support audio/mixage
libbsd-dev            # Bibliothèques BSD
valgrind              # Outil d'analyse mémoire
git-flow              # Extension Git pour workflow
gcc                   # Compilateur C GNU
g++                   # Compilateur C++ GNU
make                  # Outil de build
```

**Exemples d'ajouts courants :**

Pour le développement Python :
```
python3
python3-pip
python3-venv
```

Pour le développement Node.js :
```
nodejs
npm
```

Pour des outils supplémentaires :
```
vim
nano
htop
tmux
```

**Note :** Après modification de `packages.txt`, vous devez reconstruire le container :
1. Commande Palette (`Ctrl+Shift+P`)
2. "Dev Containers: Rebuild Container"

#### Modifier la configuration Zsh

Éditez [.devcontainer/system/tools/.zshrc](.devcontainer/system/tools/.zshrc) selon vos préférences.

**Personnalisations possibles :**
- Changer le thème (actuellement `bira`)
- Ajouter des plugins Oh My Zsh
- Définir des alias personnalisés
- Configurer des variables d'environnement

#### Changer le dépôt Git

Modifiez la variable `PROJECT_REPO` dans [.devcontainer/.env](.devcontainer/.env).

## 📝 Notes techniques

- **Image de base** : Debian 12
- **Shell par défaut** : Zsh
- **Thème Zsh** : bira
- **Workspace** : `/workspace`
- **Container name** : `dev-system`
- **Command** : `sleep infinity` (container persistant)

## 🎮 Cas d'usage

Ce Dev Container est particulièrement adapté pour :
- Développement d'applications graphiques (OpenGL, SDL2)
- Projets nécessitant du rendu graphique
- Applications avec interface graphique native
- Développement avec support audio/vidéo
- Projets C/C++ nécessitant Valgrind