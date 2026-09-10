# 🪟 Windows Auto Installer — Latest Apps

![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6?logo=windows)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?logo=powershell&logoColor=white)
![Batch](https://img.shields.io/badge/Batch-4D4D4D?logo=windows-terminal&logoColor=white)
![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen.svg)

> **One-click `.bat` script that downloads, and silently installs the latest versions of essential Windows apps — plus activates Windows.**

No more clicking "Next" a hundred times on a fresh Windows install. Just run once, walk away, come back to a fully-configured machine.

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔐 **Self-Elevation** | Auto-triggers UAC — no need to right-click "Run as Administrator" |
| 🌐 **Always Latest** | Uses `winget` to pull the current stable version from vendor repos |
| 🤫 **100% Silent** | Zero user interaction during installation |
| 🔁 **Smart Fallback** | Direct vendor download URLs if `winget` unavailable |
| 🧹 **Auto Cleanup** | Removes temporary installers after completion |
| ♻️ **Idempotent** | Safely re-runnable — skips already-installed apps |
| 🔑 **Windows Activation** | Includes KMS client activation step |

---

## 📦 Included Applications

| # | Application | Winget ID | Vendor |
|---|---|---|---|
| 1 | Adobe Acrobat Reader DC | `Adobe.Acrobat.Reader.64-bit` | Adobe |
| 2 | Google Chrome | `Google.Chrome` | Google |
| 3 | WinRAR | `RARLab.WinRAR` | RARLab |
| 4 | Microsoft Office (M365) | `Microsoft.Office` | Microsoft |

> 💡 See [`scripts/add-more-apps.bat`](scripts/add-more-apps.bat) for the extended version with **7-Zip, Notepad++, VS Code, VLC, Teams, and Firefox**.

---

## 🚀 Quick Start

```bash
# 1. Clone or download this repo
git clone https://github.com/anaseous/windows-auto-installer.git

# 2. Double-click the batch file
install-latest-apps.bat
```

In the UAC pop up — click **Yes**, and the script does the rest.

---

## 📋 Requirements

- **OS:** Windows 10 (build 1809+) or Windows 11
- **Rights:** Administrator (auto-elevated by the script)
- **Network:** Active internet connection
- **Optional:** `winget` (App Installer) — pre-installed on Windows 11 and modern Windows 10

---

## 📁 Directory Structure

```
windows-auto-installer/
├── install-latest-apps.bat      # Main one-click installer
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── .gitignore
├── docs/
│   ├── USAGE.md                 # Step-by-step usage
│   ├── CUSTOMIZATION.md         # How to add/remove apps
│   └── TROUBLESHOOTING.md       # Common issues
├── scripts/
│   └── add-more-apps.bat        # Extended version (10+ apps)
└── .github/
    └── workflows/
        └── lint.yml             # Basic syntax validation
```

---

## 🛠️ Customization

Want to add more apps, change the product key, or skip Office?

👉 See [`docs/CUSTOMIZATION.md`](docs/CUSTOMIZATION.md)

---

## 🐛 Troubleshooting

Something not working? Common fixes are documented in
[`docs/TROUBLESHOOTING.md`](docs/TROUBLESHOOTING.md).

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

- GitHub: [@anaseous](https://github.com/anaseous)

---

## ⭐ Support

If this script saved you time, please give the repo a ⭐ — it helps others find it!
