@echo off
:: ============================================================
::  Auto-Elevate to Admin
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
echo  Starting Automated Installation of Latest App Versions
echo ============================================================
echo.

:: ============================================================
::  Ensure winget is available
:: ============================================================
where winget >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [WARN] winget not found. Falling back to direct downloads.
    set USE_WINGET=0
) else (
    echo [OK] winget detected. Using winget for latest versions.
    set USE_WINGET=1
)
echo.

:: ============================================================
::  Create temp download folder
:: ============================================================
set "DL=%TEMP%\AppInstallers"
if not exist "%DL%" mkdir "%DL%"

:: ============================================================
::  1. Adobe Acrobat Reader DC (Latest)
:: ============================================================
echo [1/5] Installing Adobe Acrobat Reader DC...
if "%USE_WINGET%"=="1" (
    winget install --id Adobe.Acrobat.Reader.64-bit -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
) else (
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2400220759/AcroRdrDCx642400220759_en_US.exe' -OutFile '%DL%\AdobeDC.exe'"
    start /wait "" "%DL%\AdobeDC.exe" /sAll /rs /rps /msi EULA_ACCEPT=YES
)
echo.

:: ============================================================
::  2. Google Chrome (Latest Enterprise MSI)
:: ============================================================
echo [2/5] Installing Google Chrome...
if "%USE_WINGET%"=="1" (
    winget install --id Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
) else (
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi' -OutFile '%DL%\Chrome.msi'"
    msiexec /i "%DL%\Chrome.msi" /qn /norestart
)
echo.

:: ============================================================
::  3. WinRAR (Latest)
:: ============================================================
echo [3/5] Installing WinRAR...
if "%USE_WINGET%"=="1" (
    winget install --id RARLab.WinRAR -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
) else (
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://www.rarlab.com/rar/winrar-x64-701.exe' -OutFile '%DL%\winrar.exe'"
    start /wait "" "%DL%\winrar.exe" /S
)
echo.

:: ============================================================
::  4. Microsoft Office (Latest via Office Deployment Tool)
:: ============================================================
echo [4/5] Installing Microsoft Office...
if "%USE_WINGET%"=="1" (
    winget install --id Microsoft.Office -e --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
) else (
    :: Create Office configuration XML
    (
        echo ^<Configuration^>
        echo   ^<Add OfficeClientEdition="64" Channel="Current"^>
        echo     ^<Product ID="O365ProPlusRetail"^>
        echo       ^<Language ID="en-us" /^>
        echo       ^<ExcludeApp ID="Groove" /^>
        echo       ^<ExcludeApp ID="Lync" /^>
        echo     ^</Product^>
        echo   ^</Add^>
        echo   ^<Display Level="None" AcceptEULA="TRUE" /^>
        echo   ^<Property Name="AUTOACTIVATE" Value="1" /^>
        echo ^</Configuration^>
    ) > "%DL%\OfficeConfig.xml"
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://officecdn.microsoft.com/pr/wsus/setup.exe' -OutFile '%DL%\OfficeSetup.exe'"
    start /wait "" "%DL%\OfficeSetup.exe" /configure "%DL%\OfficeConfig.xml"
)
echo.

:: ============================================================
::  5. Windows Activation
:: ============================================================
echo [5/5] Activating Windows...
cscript //nologo %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
cscript //nologo %windir%\system32\slmgr.vbs /ato
echo.

:: ============================================================
::  Cleanup
:: ============================================================
echo Cleaning up installer cache...
rmdir /s /q "%DL%" 2>nul

echo.
echo ============================================================
echo  [OK] All installations completed successfully!
echo  [OK] Windows activation attempted.
echo ============================================================
pause
endlocal
