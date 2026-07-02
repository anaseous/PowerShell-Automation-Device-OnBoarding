# 🛠️ Customization Guide

## Adding a New App

Find its winget ID:

```cmd
winget search "app name"
```

Then add a section to `install-latest-apps.bat`:

```bat
:: ============================================================
::  X. My New App
:: ============================================================
echo [X/N] Installing My New App...
if "%USE_WINGET%"=="1" (
    winget install --id Vendor.AppName -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
)
echo.
```

## Popular Winget IDs

| App | Winget ID |
|---|---|
| 7-Zip | `7zip.7zip` |
| Notepad++ | `Notepad++.Notepad++` |
| VS Code | `Microsoft.VisualStudioCode` |
| VLC | `VideoLAN.VLC` |
| Firefox | `Mozilla.Firefox` |
| Microsoft Teams | `Microsoft.Teams` |
| Zoom | `Zoom.Zoom` |
| Git | `Git.Git` |
| Node.js LTS | `OpenJS.NodeJS.LTS` |
| Python 3.12 | `Python.Python.3.12` |
| PowerToys | `Microsoft.PowerToys` |
| Slack | `SlackTechnologies.Slack` |
| Discord | `Discord.Discord` |
| Spotify | `Spotify.Spotify` |
| GIMP | `GIMP.GIMP` |
| OBS Studio | `OBSProject.OBSStudio` |

## Removing an App

Simply delete the corresponding block from the `.bat` file.

## Changing the Windows Product Key

Locate this line:

```bat
cscript //nologo %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
```

Replace with your key:

```bat
cscript //nologo %windir%\system32\slmgr.vbs /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
```

> ⚠️ The included key (`NPPR9-FWDCX-D2C8J-H872K-2YT43`) is Microsoft's **generic Windows 11 Enterprise KMS client key** — it only activates against a reachable KMS host.

## Changing Office Edition

If not using winget's `Microsoft.Office`, edit the XML section:

- `O365ProPlusRetail` → Microsoft 365 Apps for Enterprise
- `O365BusinessRetail` → Microsoft 365 Apps for Business
- `ProPlus2021Volume` → Office LTSC Professional Plus 2021
- `Standard2021Volume` → Office LTSC Standard 2021

## Skipping Windows Activation

Comment out these lines with `::`:

```bat
:: cscript //nologo %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
:: cscript //nologo %windir%\system32\slmgr.vbs /ato
```
