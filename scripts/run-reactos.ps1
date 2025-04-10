# run-reactos.ps1
<#
.SYNOPSIS
    Boots ReactOS in QEMU with default settings.

.DESCRIPTION
    This script runs ReactOS in a virtual environment using QEMU.
    You can customize memory, CPU, and image file by editing this script
    or extending it to read from a config file.

.NOTES
    Author: Sully Greene
#>

$ErrorActionPreference = "Stop"

$QemuBin = "qemu-system-i386.exe"
$IsoPath = "$PSScriptRoot\..\isos\ReactOS-0.4.15-live.iso"
$DiskImg = "$PSScriptRoot\..\reactos.img"

# If disk image doesn't exist, create one (500MB)
if (-Not (Test-Path $DiskImg)) {
    Write-Host "💾 Creating a 500MB virtual hard disk..."
    qemu-img.exe create -f qcow2 $DiskImg 500M
}

Write-Host "🚀 Launching ReactOS..."
& $QemuBin `
    -cdrom $IsoPath `
    -hda $DiskImg `
    -boot d `
    -m 512 `
    -cpu qemu32 `
    -vga std `
    -net nic `
    -net user `
    -name "ReactOS VM" `
    -enable-kvm:$false

