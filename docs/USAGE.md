# 📖 Usage Guide

## Step 1 — Download

Either clone the repo:
```bash
git clone https://github.com/<your-username>/windows-auto-installer.git
cd windows-auto-installer
```

Or download the ZIP from GitHub and extract it.

## Step 2 — Run

Simply **double-click** `install-latest-apps.bat`.

You will see a UAC (User Account Control) prompt asking:

> Do you want to allow this app to make changes to your device?

Click **Yes**.

## Step 3 — Wait

The script will now:

1. ✅ Detect if `winget` is available
2. ⬇️ Download and install Adobe Acrobat Reader DC
3. ⬇️ Download and install Google Chrome
4. ⬇️ Download and install WinRAR
5. ⬇️ Download and install Microsoft Office
6. 🔑 Attempt Windows activation
7. 🧹 Clean up temporary files

⏱ **Typical duration:** 10–20 minutes depending on internet speed
(Microsoft Office is the slowest, ~2–3 GB download).

## Step 4 — Verify

After the script completes, verify installations:

- Press `Win + S` → search for each app
- Or run: `winget list` to see all installed packages

## Running the Extended Version

For more apps (7-Zip, Notepad++, VS Code, VLC, Teams, Firefox), run:

```
scripts\add-more-apps.bat
```

## Command-Line Execution

You can also run from an already-elevated PowerShell / CMD:

```cmd
cd C:\path\to\windows-auto-installer
install-latest-apps.bat
```

## Logging

To capture output to a log file:

```cmd
install-latest-apps.bat > install.log 2>&1
```
