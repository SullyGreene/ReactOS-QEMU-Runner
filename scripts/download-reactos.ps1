# download-reactos.ps1
<#
.SYNOPSIS
    Downloads the latest ReactOS ISO image (release build).

.DESCRIPTION
    This script pulls the latest stable ReactOS bootable ISO and saves it
    to the ./isos directory. Useful for launching ReactOS via QEMU.

.NOTES
    ReactOS download URL: https://reactos.org/download
#>

$ErrorActionPreference = "Stop"

$ReactOSUrl = "https://sourceforge.net/projects/reactos/files/ReactOS/0.4.15/ReactOS-0.4.15-live.iso/download"
$OutputDir = "$PSScriptRoot\..\isos"
$OutputIso = "$OutputDir\ReactOS-0.4.15-live.iso"

# Create directory if it doesn't exist
if (-Not (Test-Path -Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

Write-Host "🌐 Downloading ReactOS 0.4.15 ISO..."
Invoke-WebRequest -Uri $ReactOSUrl -OutFile $OutputIso -UseBasicParsing

Write-Host "✅ ISO saved to: $OutputIso"
