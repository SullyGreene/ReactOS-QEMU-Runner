# 🌀 ReactOS QEMU Runner (Windows)

This project automates the setup and execution of [ReactOS](https://reactos.org/) using [QEMU](https://www.qemu.org/) on Windows systems. It's intended for developers, testers, and tinkerers who want a scriptable environment to experiment with ReactOS in a virtual machine.

---

## 📦 Features

- Download & configure QEMU for Windows
- Fetch the latest ReactOS ISO (Release or Daily Build)
- Launch ReactOS in QEMU with customizable hardware settings
- Easily extendable with snapshotting, test scripts, and automation

---

## 🖥️ Requirements

- Windows 10 or higher
- PowerShell 5.0+
- Internet connection (for downloading QEMU & ISO)

---

## 🛠️ Setup Instructions

1. **Clone this repository**
   ```bash
   git clone https://github.com/SullyGreene/reactos-qemu-runner.git
   cd reactos-qemu-runner
   ```

2. **Run the setup**
   ```powershell
   .\scripts\setup-env.ps1
   ```

3. **Download the latest ReactOS ISO**
   ```powershell
   .\scripts\download-reactos.ps1
   ```

4. **Start the VM**
   ```powershell
   .\scripts\run-reactos.ps1
   ```

---

## ⚙️ Configuration

Edit `config/qemu-config.json` to adjust:

- Memory allocation
- CPU cores
- Boot options
- Disk image paths

---

## 🚧 Notes

- ReactOS is **alpha-quality** software. Expect bugs and system instability.
- For testing only. Use in a VM, **never on a production machine**.

---

## 📘 About ReactOS

> ReactOS™ is a free and open-source operating system compatible with Microsoft Windows® drivers and applications. This tool helps launch ReactOS easily on any Windows machine using QEMU virtualization.

---

## 📄 License

This project is licensed under the MIT License. ReactOS itself is licensed under GNU GPL 3.0.
