# yt-dlp-gui

Ce projet est une application Electron pour télécharger des vidéos en utilisant `yt-dlp`. L'application fournit une interface utilisateur simple pour entrer l'URL de la vidéo et sélectionner le dossier de destination pour le téléchargement.

## Dépendances

Ce projet nécessite les dépendances suivantes pour fonctionner correctement :

- [Node.js](https://nodejs.org/en/download/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) : Un outil en ligne de commande pour télécharger des vidéos à partir de divers sites.
- [ffmpeg](https://www.ffmpeg.org/) : Un outil en ligne de commande pour manipuler des fichiers audio et vidéo.

Assurez-vous d'avoir installé ces dépendances et qu'elles sont disponibles dans votre `PATH` système avant d'exécuter l'application.

## Exécution en mode de développement

Pour exécuter ce projet, suivez les étapes ci-dessous :

1. Clonez ce dépôt sur votre machine locale.
2. Naviguez vers le dossier du projet et installez les dépendances Node.js en exécutant la commande suivante : `npm install`
3. Exécutez l'application en mode développement en utilisant la commande suivante : `npm start`

## Création des binaires multiplateforme

Pour créer des binaires pour différentes plateformes, utilisez les commandes de build suivantes :

### Windows

```sh
npm run build:win
```

### macOS

```sh
npm run build:mac
```

### Linux

```sh
npm run build:linux
```

Les binaires seront créés dans le dossier `build` du projet.

## Utilisation

- Pour utiliser l'application, entrez simplement l'URL de la vidéo que vous souhaitez télécharger dans le champ URL et sélectionnez le dossier de destination pour le téléchargement. 
- Cliquez ensuite sur le bouton "soumettre" pour commencer le téléchargement. 
- La progression du téléchargement sera affichée à l'écran.

![image](https://user-images.githubusercontent.com/44167150/225592624-883bdefd-61c2-4807-a8bc-8185c5192b47.png)

![image](https://user-images.githubusercontent.com/44167150/225592790-d34d1d80-9082-49ac-b377-21b165fb9998.png)

![image](https://user-images.githubusercontent.com/44167150/225592890-ae1856bf-b36f-46a1-af31-0667459a19f7.png)

# Licence
Ce projet est sous licence MIT. 
Consultez le fichier LICENSE pour plus de détails.




