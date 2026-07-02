# Contributing

Thanks for your interest in improving **Windows Auto Installer**! 🎉

## How to Contribute

1. **Fork** the repository
2. Create a feature branch: `git checkout -b feature/my-improvement`
3. Test your changes on a real Windows 10/11 VM
4. Commit: `git commit -m "Add: my improvement"`
5. Push: `git push origin feature/my-improvement`
6. Open a **Pull Request**

## Ideas We Welcome

- Additional silent-install apps
- Better error handling / logging
- Multi-language support
- GUI wrapper (PowerShell / WPF)
- Chocolatey alternative branch

## Code Style

- Keep `.bat` compatible with Windows 10 1809+ (no Windows 11-only syntax)
- Comment each installation section clearly
- Always use `--silent` and `--accept-*-agreements` flags for winget

## Reporting Bugs

Please open an [Issue](../../issues) with:
- Windows version (`winver`)
- winget version (`winget --version`)
- Full script output / error message
- Steps to reproduce
