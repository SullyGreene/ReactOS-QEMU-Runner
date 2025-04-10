# setup-env.ps1
<#
.SYNOPSIS
    Downloads and sets up QEMU for Windows locally.

.DESCRIPTION
    This script downloads the latest stable QEMU for Windows from the official site,
    extracts it to a local directory, and updates the PATH for the current session.

.NOTES
    Author: Sully Greene (a.k.a. The Wanderer in Code)
#>

$ErrorActionPreference = 'Stop'

# Configuration
$QemuUrl = "https://qemu.weilnetz.de/w64/2023/qemu-w64-setup-20231221.exe"
$QemuInstaller = "qemu-setup.exe"
$QemuInstallDir = "$PSScriptRoot\tools\qemu"

# Ensure tools folder exists
New-Item -ItemType Directory -Force -Path "$PSScriptRoot\tools" | Out-Null

Write-Host "🔽 Downloading QEMU installer..."
Invoke-WebRequest -Uri $QemuUrl -OutFile "$PSScriptRoot\tools\$QemuInstaller"

Write-Host "📦 Installing QEMU to $QemuInstallDir..."
Start-Process -Wait -FilePath "$PSScriptRoot\tools\$QemuInstaller" -ArgumentList "/S", "/D=$QemuInstallDir"

# Update PATH for this session
$env:Path += ";$QemuInstallDir"

Write-Host "`n✅ QEMU setup complete!"
Write-Host "You can now run QEMU with: qemu-system-i386"
