# yt-dlp-gui

Ce projet est une application Electron pour télécharger des vidéos en utilisant `yt-dlp`. L'application fournit une interface utilisateur simple pour entrer l'URL de la vidéo et sélectionner le dossier de destination pour le téléchargement.

## Dépendances

Ce projet nécessite les dépendances suivantes pour fonctionner correctement :

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) : Un outil en ligne de commande pour télécharger des vidéos à partir de divers sites.
- [ffmpeg](https://www.ffmpeg.org/) : Un outil en ligne de commande pour manipuler des fichiers audio et vidéo.

Assurez-vous d'avoir installé ces dépendances et qu'elles sont disponibles dans votre `PATH` système avant d'exécuter l'application.

## Installation

Pour installer et exécuter ce projet, suivez les étapes ci-dessous :

1. Clonez ce dépôt sur votre machine locale.
2. Naviguez vers le dossier du projet et installez les dépendances Node.js en exécutant la commande suivante : `npm install`
3. Exécutez l'application en mode développement en utilisant la commande suivante : `npm start`
4. Pour créer des packages pour différentes plateformes, utilisez les commandes appropriées pour `electron-builder` ou `electron-packager`.

## Utilisation

- Pour utiliser l'application, entrez simplement l'URL de la vidéo que vous souhaitez télécharger dans le champ URL et sélectionnez le dossier de destination pour le téléchargement. 
- Cliquez ensuite sur le bouton "soumettre" pour commencer le téléchargement. 
- La progression du téléchargement sera affichée à l'écran.




