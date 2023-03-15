const { app, BrowserWindow, ipcMain, dialog } = require('electron');
const { exec } = require('child_process');
const path = require('path');

function checkDependencies() {
    const dependencies = ['ffmpeg', 'yt-dlp'];

    for (const dependency of dependencies) {
        exec(`${dependency} --help`, (error) => {
            if (error) {
                dialog.showErrorBox('Erreur de dépendance', `La commande ${dependency} est introuvable. Veuillez installer ${dependency} et redémarrer l'application.`);
                app.quit();
            }
        });
    }
}

function createWindow() {
    // Vérifiez les dépendances avant de créer la fenêtre
    checkDependencies();
    const win = new BrowserWindow({
        width: 720,
        height: 480,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
        },
    });

    win.loadFile('index.html');
    win.setMenu(null); // Ajoutez cette ligne pour masquer le menu
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
        createWindow();
    }
});

ipcMain.handle('select-output-path', async(event) => {
    const result = await dialog.showOpenDialog({
        properties: ['openDirectory'],
    });
    return result.filePaths[0];
});