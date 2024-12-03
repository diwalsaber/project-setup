#!/bin/bash

# Chemin absolu vers ton dossier iCloud pour les projets personnels
ICLOUD_PATH="/Users/diwal/Library/Mobile Documents/com~apple~CloudDocs/Work/Projects/01_personnal_projects"

# Demander à l'utilisateur de saisir le nom du projet
echo "Nom du projet :"
read PROJECT_NAME

# Créer les sous-dossiers dans le dossier iCloud
mkdir -p "$ICLOUD_PATH/$PROJECT_NAME/"{data/{raw,processed},notebooks,src,tests}

# Ajouter un README.md vide
touch "$ICLOUD_PATH/$PROJECT_NAME/README.md"

# Ajouter un contenu par défaut dans le README
echo "# $PROJECT_NAME" > "$ICLOUD_PATH/$PROJECT_NAME/README.md"

# Confirmer la création du projet
echo "Structure créée pour $PROJECT_NAME dans $ICLOUD_PATH/$PROJECT_NAME/"

