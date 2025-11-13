---
layout: page
title: Setting up Git, Python, and VS Code on Windows
permalink: /devops_pages/windows.html
nav_exclude: true

---

This guide will walk you through installing and configuring Git, Python, and Visual Studio Code on Windows.

### 1. Installing Git for Windows

Git is a distributed version control system that allows you to track changes in your code and collaborate with others.

#### 1.1. Download Git

1. Visit the official Git website: [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. The download should start automatically. If not, click the appropriate download link for your system (64-bit or 32-bit)
3. Run the downloaded installer (`Git-<version>-64-bit.exe`)

#### 1.2. Install Git

1. Click "Next" through the initial setup screens
2. **Select Components**: Keep the default selections, which include:
   - Git Bash Here
   - Git GUI Here
   - Git LFS (Large File Support)
   - Associate .git* configuration files with the default text editor
3. **Choosing the default editor**: Select your preferred text editor (Visual Studio Code is recommended if you plan to install it)
4. **Adjusting your PATH environment**: Choose "Git from the command line and also from 3rd-party software" (recommended)
5. **Choosing HTTPS transport backend**: Use "Use the OpenSSL library" (default)
6. **Configuring line ending conversions**: Choose "Checkout Windows-style, commit Unix-style line endings" (recommended for Windows)
7. **Configuring the terminal emulator**: Choose "Use MinTTY" (default)
8. **Choose default behavior of `git pull`**: Select "Default (fast-forward or merge)" (default)
9. **Choose a credential helper**: Select "Git Credential Manager" (recommended)
10. **Configuring extra options**: Keep defaults (Enable file system caching, Enable symbolic links)
11. Click "Install" and wait for the installation to complete
12. Click "Finish"

#### 1.3. Verify Git installation

1. Open Command Prompt or PowerShell (press `Win + R`, type `cmd` or `powershell`, and press Enter)
2. Type the following command and press Enter:

```bash
git --version
```

You should see output like: `git version 2.x.x.windows.x`

#### 1.4. Configure Git

Set up your Git identity with your name and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Optionally, configure the default branch name:

```bash
git config --global init.defaultBranch main
```

### 2. Installing Python

Python is a versatile programming language widely used for data science, web development, automation, and more.

#### 2.1. Download Python

1. Visit the official Python website: [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Click the "Download Python 3.x.x" button (the latest stable version)
3. Run the downloaded installer (`python-3.x.x-amd64.exe`)

#### 2.2. Install Python

1. **IMPORTANT**: Check the box that says "Add python.exe to PATH" at the bottom of the installer window
2. Click "Install Now" for a standard installation, or choose "Customize installation" for advanced options:
   - **Optional Features**: Keep all boxes checked (pip, documentation, tcl/tk and IDLE, Python test suite, py launcher)
   - **Advanced Options**: 
     - Check "Install for all users" if you want Python available system-wide
     - Check "Add Python to environment variables"
     - Check "Create shortcuts for installed applications"
     - Keep the default installation directory or choose a custom location
3. Click "Install" and wait for the installation to complete
4. Click "Close" when finished

#### 2.3. Verify Python installation

1. Open a new Command Prompt or PowerShell window (important: open a new window after installation)
2. Type the following commands:

```bash
python --version
```

You should see: `Python 3.x.x`

```bash
pip --version
```

You should see: `pip x.x.x from ...`

#### 2.4. Update pip (optional but recommended)

```bash
python -m pip install --upgrade pip
```

### 3. Installing Visual Studio Code

Visual Studio Code (VS Code) is a powerful, lightweight code editor with excellent support for Python, Git, and many other languages.

#### 3.1. Download VS Code

1. Visit the official VS Code website: [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Click the "Download for Windows" button
3. Run the downloaded installer (`VSCodeUserSetup-x64-<version>.exe`)

#### 3.2. Install VS Code

1. Accept the license agreement and click "Next"
2. Choose the installation location (default is recommended) and click "Next"
3. Choose the Start Menu folder (default is fine) and click "Next"
4. **Select Additional Tasks** (recommended selections):
   - ✓ Create a desktop icon
   - ✓ Add "Open with Code" action to Windows Explorer file context menu
   - ✓ Add "Open with Code" action to Windows Explorer directory context menu
   - ✓ Register Code as an editor for supported file types
   - ✓ Add to PATH (requires shell restart)
5. Click "Next" and then "Install"
6. Click "Finish" to launch VS Code


### 4. Troubleshooting

#### Git not recognized in Command Prompt
- Close and reopen Command Prompt/PowerShell after Git installation
- Check if Git is in your PATH: `echo %PATH%` (CMD) or `$env:PATH` (PowerShell)
- Restart your computer if needed

#### Python not recognized
- Ensure "Add to PATH" was checked during installation
- Manually add Python to PATH via System Environment Variables
- Reinstall Python with the "Add to PATH" option selected

#### VS Code can't find Python
- Press `Ctrl+Shift+P` and search for "Python: Select Interpreter"
- If no interpreters appear, verify Python installation: `python --version` in terminal
- Reload VS Code window after installing Python

#### Permission errors when installing Python packages
- Try running Command Prompt or PowerShell as Administrator
- Or install packages with the `--user` flag: `pip install --user package_name`
