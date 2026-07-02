# 🐛 Troubleshooting

## ❌ "winget is not recognized"

**Cause:** App Installer is missing or outdated.

**Fix:**
1. Open Microsoft Store
2. Search for **App Installer**
3. Click **Update** or **Install**
4. Re-run the script — it will automatically use winget

**Alternative:** The script will fall back to direct downloads if winget is unavailable.

---

## ❌ UAC Prompt Doesn't Appear / Access Denied

**Cause:** UAC disabled or blocked by group policy.

**Fix:** Manually run as admin:
1. Right-click `install-latest-apps.bat`
2. Select **Run as administrator**

---

## ❌ Office Install Fails or Times Out

**Cause:** Office is a large (~2–3 GB) download and can be slow.

**Fix:**
1. Ensure stable internet connection
2. Temporarily disable antivirus real-time scanning
3. Run this step manually:
   ```cmd
   winget install --id Microsoft.Office -e --silent --accept-package-agreements --accept-source-agreements
   ```

---

## ❌ Windows Activation Error 0xC004F074 / 0xC004F038

**Cause:** No KMS host reachable on the network.

**Fix:**
- If you're in an enterprise: check with IT for the KMS server address
- If you're a home user: use your own product key (see [CUSTOMIZATION.md](CUSTOMIZATION.md))
- Or skip activation and use retail activation via Settings → Activation

---

## ❌ Chrome / Adobe Reader Reports "Already Installed"

This is **not an error**. Winget correctly detects existing installations and skips them.

---

## ❌ PowerShell Execution Policy Error

**Cause:** Restricted execution policy.

**Fix:** Run once as admin:
```powershell
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
```

---

## ❌ Antivirus Flags the Script

Some AV products flag `.bat` files that download executables. This is a **false positive**.

**Fix:**
- Add the folder to your antivirus exclusions
- Or review the script — it's fully open source

---

## 📩 Still Stuck?

Open an [Issue](../../issues) with:
- Windows version (`winver`)
- Full console output
- The exact error message
