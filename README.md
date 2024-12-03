# Project Setup Automation

Ce dépôt contient des scripts et une documentation complète pour configurer rapidement un environnement de développement sur macOS, avec des outils essentiels tels que Homebrew, Git, Python (via pyenv), et la gestion des clés SSH pour GitHub. Il inclut également un script pour générer une structure standardisée pour tes projets.

---

## **Table des matières**
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Scripts inclus](#scripts-inclus)
  - [setup.sh](#setupsh)
  - [generate_project_structure.sh](#generate_project_structuresh)
- [Liens symboliques vers iCloud](#liens-symboliques-vers-icloud)
- [Structure des dossiers générés](#structure-des-dossiers-générés)
- [Prochaines améliorations](#prochaines-améliorations)
- [Liens utiles](#liens-utiles)

---

## **Prérequis**

1. Avoir un Mac avec macOS à jour. Mets à jour ton système d'exploitation avec :
   ```bash
   sudo softwareupdate --install --all
   xcode-select --install

2. Installation des outils de ligne de commande Xcode : Ces outils sont nécessaires pour Homebrew, Git et d'autres programmes.

    ```bash
    xcode-select --install
    Installation de Git :

3. Vérifie si Git est déjà installé :
    ```bash
    git --version
    Si Git n'est pas installé ou si tu veux la dernière version :
    Installe Homebrew si ce n'est pas encore fait :

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

4. Installe Git via Homebrew :
    ```bash
    brew install git

## **Installation**
Une fois les prérequis installés, suis ces étapes pour configurer ton environnement de développement :

Cloner ce dépôt : Clone ce dépôt dans le répertoire de ton choix :

bash
Copier le code
git clone git@github.com:diwalsaber/project-setup.git
cd project-setup
Exécuter le script setup.sh : Ce script installe et configure les outils essentiels :

bash
Copier le code
bash scripts/setup.sh
Créer une structure de projet : Utilise le script generate_project_structure.sh pour générer une structure standardisée :

bash
Copier le code
bash scripts/generate_project_structure.sh
Scripts inclus
1. setup.sh
Ce script installe et configure automatiquement :

Homebrew : Gestionnaire de paquets pour macOS.
Git et GitHub CLI : Contrôle de version et intégration avec GitHub.
Python via pyenv : Gestionnaire de versions Python.
Clé SSH pour GitHub : Génération et ajout automatique de la clé SSH.
Fonctionnement :
Installe Homebrew et les outils nécessaires :

bash
Copier le code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install git gh pyenv
Configure Python via pyenv :

bash
Copier le code
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
source ~/.zshrc
pyenv install 3.10.12
pyenv global 3.10.12
Configure une clé SSH et l’ajoute à GitHub via GitHub CLI :

bash
Copier le code
ssh-keygen -t ed25519 -C "ton_email@example.com" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
gh ssh-key add ~/.ssh/id_ed25519.pub --title "MacBook Pro - Work"
2. generate_project_structure.sh
Ce script crée une structure de projet standardisée dans un répertoire défini (par défaut, dans iCloud). Il génère les dossiers suivants :

data/ : Contient les données brutes et transformées.
raw/ : Données brutes non modifiées.
processed/ : Données nettoyées et préparées.
notebooks/ : Fichiers Jupyter Notebook pour l'analyse exploratoire.
src/ : Code source.
tests/ : Tests unitaires ou scripts de validation.
Fonctionnement :
Le script demande le nom du projet :

bash
Copier le code
echo "Nom du projet :"
read PROJECT_NAME
Génère la structure suivante :

plaintext
Copier le code
/Users/diwal/Library/Mobile Documents/com~apple~CloudDocs/Work/Projects/$PROJECT_NAME/
├── data/
│   ├── raw/
│   ├── processed/
├── notebooks/
├── src/
├── tests/
└── README.md
Liens symboliques vers iCloud
Pour simplifier l'accès aux dossiers iCloud (dont le chemin est long), des liens symboliques peuvent être créés :

bash
Copier le code
ln -s "/Users/diwal/Library/Mobile Documents/com~apple~CloudDocs/Work/Projects" ~/icloud_projects
ln -s "/Users/diwal/Library/Mobile Documents/com~apple~CloudDocs/Work/scripts" ~/icloud_scripts
Tu peux alors accéder à ces dossiers via des chemins plus simples :

~/icloud_projects pour les projets.
~/icloud_scripts pour les scripts.
Structure des dossiers générés
Voici un exemple de structure complète pour un projet :

plaintext
Copier le code
project-name/
├── data/
│   ├── raw/                # Données brutes
│   ├── processed/          # Données nettoyées
├── notebooks/              # Notebooks Jupyter
├── src/                    # Code source
├── tests/                  # Tests unitaires
└── README.md               # Documentation du projet
Prochaines améliorations
Voici des idées pour améliorer les scripts existants :

Ajouter Docker à setup.sh pour les conteneurs.
Ajouter l'installation et la configuration de Visual Studio Code (avec extensions Markdown).
Ajouter des options interactives pour generate_project_structure.sh, comme choisir les dossiers à inclure.
Liens utiles
Homebrew
GitHub CLI
Pyenv
SSH Documentation
Auteurs
Ce projet a été préparé et configuré par diwalsaber pour automatiser et standardiser la configuration d'un environnement de développement.

yaml
Copier le code

---

### **Ajout des fichiers à Git**

1. **Vérifie que tout est prêt à être versionné** :
   ```bash
   git status
Ajoute et commit les fichiers :

bash
Copier le code
git add .
git commit -m "Add detailed README and setup scripts"
Pousse le tout vers GitHub :

bash
Copier le code
git push origin main
