# Install yt-dlp
if (!(Get-Command -Name "yt-dlp" -ErrorAction SilentlyContinue)) {
    Write-Host "Installing yt-dlp..."
    $YtDlpUrl = "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
    $YtDlpOutput = "$env:USERPROFILE\AppData\Local\yt-dlp\yt-dlp.exe"
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\AppData\Local\yt-dlp" | Out-Null
    Invoke-WebRequest -Uri $YtDlpUrl -OutFile $YtDlpOutput

    # Add yt-dlp to Path
    $Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    $NewPath = "$env:USERPROFILE\AppData\Local\yt-dlp;$Path"
    [System.Environment]::SetEnvironmentVariable("Path", $NewPath, [System.EnvironmentVariableTarget]::User)
    Write-Host "yt-dlp installed and added to Path."
}
else {
    Write-Host "yt-dlp is already installed."
}

# Install ffmpeg
if (!(Get-Command -Name "ffmpeg" -ErrorAction SilentlyContinue)) {
    Write-Host "Installing ffmpeg..."
    $FfmpegUrl = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
    $FfmpegOutput = "$env:USERPROFILE\AppData\Local\Temp\ffmpeg.zip"
    $FfmpegFolder = "$env:USERPROFILE\AppData\Local\ffmpeg"
    Invoke-WebRequest -Uri $FfmpegUrl -OutFile $FfmpegOutput

    # Extract ffmpeg
    Expand-Archive -LiteralPath $FfmpegOutput -DestinationPath $FfmpegFolder | Out-Null

    # Find the folder name with the ffmpeg version
    $FfmpegVersionFolder = Get-ChildItem -Path $FfmpegFolder | Where-Object { $_.PSIsContainer -and $_.Name -like "ffmpeg-*-essentials_build" } | Select-Object -ExpandProperty Name

    # Add ffmpeg to Path
    $Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
    $NewPath = "$env:USERPROFILE\AppData\Local\ffmpeg\$FfmpegVersionFolder\bin;$Path"
    [System.Environment]::SetEnvironmentVariable("Path", $NewPath, [System.EnvironmentVariableTarget]::User)
    Write-Host "ffmpeg installed and added to Path."
}
else {
    Write-Host "ffmpeg is already installed."
}

Write-Host "Installation completed. You can now use yt-dlp and ffmpeg without restarting."
