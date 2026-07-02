# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-07-02

### Added
- Initial release of Windows Auto Installer
- Self-elevating batch script (auto UAC prompt)
- `winget`-based installation for latest versions
- Direct-download fallback for systems without winget
- Included apps: Adobe Reader DC, Google Chrome, WinRAR, Microsoft Office
- Windows activation step using KMS client key
- Automatic cleanup of installer cache
- Extended script `add-more-apps.bat` with 7-Zip, Notepad++, VS Code, VLC, Teams, Firefox
- Documentation: USAGE, CUSTOMIZATION, TROUBLESHOOTING
- GitHub Actions workflow for basic syntax validation
