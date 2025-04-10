# run-reactos.ps1
<#
.SYNOPSIS
    Boots ReactOS in QEMU with user-defined settings from config/qemu-config.json.

.DESCRIPTION
    Loads QEMU launch options from config/qemu-config.json, creates a virtual hard drive if missing,
    and runs the ReactOS ISO in a QEMU VM.

.NOTES
    Author: Sully Greene
#>

$ErrorActionPreference = "Stop"

# Paths
$ConfigPath = "$PSScriptRoot\..\config\qemu-config.json"
$IsoPath = "$PSScriptRoot\..\isos\ReactOS-0.4.15-live.iso"
$DiskImg = "$PSScriptRoot\..\reactos.img"
$QemuBin = "qemu-system-i386.exe"

# Load configuration
if (-Not (Test-Path $ConfigPath)) {
    throw "Missing config file: $ConfigPath"
}
$config = Get-Content $ConfigPath | ConvertFrom-Json

# Create disk image if needed
if (-Not (Test-Path $DiskImg)) {
    Write-Host "💾 Creating a $($config.disk_size_mb)MB virtual hard disk..."
    qemu-img.exe create -f qcow2 $DiskImg "$($config.disk_size_mb)M"
}

# Launch ReactOS in QEMU
Write-Host "🚀 Launching ReactOS with settings from config..."
& $QemuBin `
    -cdrom $IsoPath `
    -hda $DiskImg `
    -boot $config.boot `
    -m $config.memory `
    -cpu $config.cpu `
    -vga $config.vga `
    -net nic `
    -net user `
    -name $config.vm_name `
    -enable-kvm:$config.enable_kvm
