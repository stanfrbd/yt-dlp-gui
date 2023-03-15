# Installer yt-dlp
if (!(Get-Command -Name "yt-dlp" -ErrorAction SilentlyContinue)) {
    Write-Host "Installation de yt-dlp..."
    $YtDlpUrl = "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
    $YtDlpOutput = "$env:USERPROFILE\AppData\Local\yt-dlp\yt-dlp.exe"
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\AppData\Local\yt-dlp" | Out-Null
    Invoke-WebRequest -Uri $YtDlpUrl -OutFile $YtDlpOutput

    # Ajouter yt-dlp au Path
    $Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    $NewPath = "$env:USERPROFILE\AppData\Local\yt-dlp;$Path"
    [System.Environment]::SetEnvironmentVariable("Path", $NewPath, [System.EnvironmentVariableTarget]::User)
    Write-Host "yt-dlp installé et ajouté au Path."
} else {
    Write-Host "yt-dlp est déjà installé."
}

# Installer ffmpeg
if (!(Get-Command -Name "ffmpeg" -ErrorAction SilentlyContinue)) {
    Write-Host "Installation de ffmpeg..."
    $FfmpegUrl = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
    $FfmpegOutput = "$env:USERPROFILE\AppData\Local\Temp\ffmpeg.zip"
    $FfmpegFolder = "$env:USERPROFILE\AppData\Local\ffmpeg"
    Invoke-WebRequest -Uri $FfmpegUrl -OutFile $FfmpegOutput

    # Extraire ffmpeg
    Expand-Archive -LiteralPath $FfmpegOutput -DestinationPath $FfmpegFolder -y | Out-Null

    # Ajouter ffmpeg au Path
    $Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    $NewPath = "$env:USERPROFILE\AppData\Local\ffmpeg\bin;$Path"
    [System.Environment]::SetEnvironmentVariable("Path", $NewPath, [System.EnvironmentVariableTarget]::User)
    Write-Host "ffmpeg installé et ajouté au Path."
} else {
    Write-Host "ffmpeg est déjà installé."
}

Write-Host "Installation terminée. Vous pouvez maintenant utiliser yt-dlp et ffmpeg sans redémarrer."
