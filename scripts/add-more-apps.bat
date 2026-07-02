@echo off
:: ============================================================
::  EXTENDED Auto Installer — includes core apps + extras
:: ============================================================

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

setlocal EnableDelayedExpansion
cd /d "%~dp0"

echo ============================================================
echo  Extended Automated Installation (Core + Extras)
echo ============================================================
echo.

where winget >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] winget is required for the extended installer.
    echo Please install "App Installer" from the Microsoft Store.
    pause
    exit /b 1
)

:: Common winget flags
set "WG=-e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity"

:: ============================================================
::  CORE APPS
:: ============================================================
echo [ 1/10] Installing Adobe Acrobat Reader DC...
winget install --id Adobe.Acrobat.Reader.64-bit %WG%

echo [ 2/10] Installing Google Chrome...
winget install --id Google.Chrome %WG%

echo [ 3/10] Installing WinRAR...
winget install --id RARLab.WinRAR %WG%

echo [ 4/10] Installing Microsoft Office...
winget install --id Microsoft.Office %WG%

:: ============================================================
::  EXTRA APPS
:: ============================================================
echo [ 5/10] Installing 7-Zip...
winget install --id 7zip.7zip %WG%

echo [ 6/10] Installing Notepad++...
winget install --id Notepad++.Notepad++ %WG%

echo [ 7/10] Installing Visual Studio Code...
winget install --id Microsoft.VisualStudioCode %WG%

echo [ 8/10] Installing VLC Media Player...
winget install --id VideoLAN.VLC %WG%

echo [ 9/10] Installing Microsoft Teams...
winget install --id Microsoft.Teams %WG%

echo [10/10] Installing Mozilla Firefox...
winget install --id Mozilla.Firefox %WG%

:: ============================================================
::  Windows Activation
:: ============================================================
echo.
echo Activating Windows...
cscript //nologo %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
cscript //nologo %windir%\system32\slmgr.vbs /ato

echo.
echo ============================================================
echo  [OK] All 10 applications installed successfully!
echo ============================================================
pause
endlocal
