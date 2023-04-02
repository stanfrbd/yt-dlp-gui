const {
    ipcRenderer
} = require('electron');
const {
    exec
} = require('child_process');

const { clipboard } = require('electron');

function pasteFromClipboard() {
    const clipboardContent = clipboard.readText();
    const isValidLink = clipboardContent.includes('https://');

    if (isValidLink) {
        const urlInput = document.getElementById('url');
        urlInput.value = clipboardContent;
    } else {
        alert("Le contenu précédemment copié n'est pas un lien valide.");
    }
}

async function selectOutputPath() {
    const result = await ipcRenderer.invoke('select-output-path');
    document.getElementById('outputPath').value = result;
}

// Ajoutez cette fonction pour ouvrir le dossier de sortie
function openOutputFolder(outputPath) {
    const {
        shell
    } = require('electron');
    //shell.showItemInFolder(outputPath);
    shell.openPath(outputPath);
}

// Ajoutez cette fonction pour réinitialiser le formulaire
function resetForm() {
    document.getElementById('url').value = '';
    document.getElementById('extraOptions').value = '';
    document.getElementById('progressBar').style.display = 'none';
    document.getElementById('progressLabel').style.display = 'none';
    document.getElementById('downloadAnother').style.display = 'none';
    // Ajoutez cette ligne pour effacer le message "Téléchargement terminé"
    document.getElementById('messageContainer').innerHTML = '';
}

function handleSubmit() {
    const url = document.getElementById('url').value;
    const outputPath = document.getElementById('outputPath').value;
    const extraOptions = document.getElementById('extraOptions').value;
    const progressBar = document.getElementById('progressBar');
    const progressLabel = document.getElementById('progressLabel');
    const messageContainer = document.getElementById('messageContainer');
    const downloadAnotherButton = document.getElementById('downloadAnother');

    // Vérifiez si l'URL est vide ou invalide
    if (!url || !url.includes('https://')) {
        alert("Veuillez entrer une URL valide");
        return;
    }

    // Vérifiez si le chemin de sortie est vide
    if (!outputPath || outputPath == "undefined") {
        alert("Veuillez entrer un chemin de sortie");
        return;
    }

    progressBar.style.display = 'inline'; // Afficher la barre de progression
    progressBar.value = 0;
    messageContainer.innerHTML = '';

    progressLabel.style.display = 'inline'; // Afficher le label "Progression"

    const command = `yt-dlp -f "bestvideo[height<=1080]+bestaudio" --merge-output-format mp4 -o "${outputPath}/%(title)s.%(ext)s" ${extraOptions} ${url}`;

    const process = exec(command);

    process.stdout.on('data', (data) => {
        const progressRegex = /(\d+\.\d)% of/;
        const match = data.match(progressRegex);

        if (match) {
            progressBar.value = parseFloat(match[1]);
        }
    });

    process.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });

    process.on('exit', (code) => {
        if (code === 0) {
            messageContainer.innerHTML = '✅ Téléchargement terminé !';
            progressBar.value = 100;
            openOutputFolder(outputPath);
            downloadAnotherButton.style.display = 'inline'; // Afficher le bouton "Télécharger une autre vidéo"
        } else {
            messageContainer.innerHTML = `Erreur : Le processus s'est terminé avec le code ${code}`;
        }
    });
}