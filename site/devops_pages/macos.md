---
layout: page
title: Setting up Git, Python, and VS Code on macOS
permalink: /devops_pages/macos.html
nav_exclude: true
---

This guide will walk you through installing and configuring Git, Python, and Visual Studio Code on macOS.

### 1. Installing Homebrew (Recommended)

Homebrew is a package manager for macOS that makes installing development tools much easier. While not strictly required, it's highly recommended.

#### 1.1. Install Homebrew

1. Open Terminal (press `Cmd+Space`, type "Terminal", and press Enter)
2. Visit [https://brew.sh](https://brew.sh) or run this command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Follow the on-screen instructions
4. After installation, you may need to add Homebrew to your PATH. The installer will provide the exact commands, which typically look like:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Note: The path differs for Apple Silicon Macs (`/opt/homebrew`) vs Intel Macs (`/usr/local`).

#### 1.2. Verify Homebrew installation

```bash
brew --version
```

You should see output like: `Homebrew 4.x.x`

### 2. Installing Git

Git comes pre-installed on macOS, but it's often an older version. We'll install a more recent version using Homebrew.

#### 2.1. Check if Git is already installed

```bash
git --version
```

If Git is installed, you'll see the version number. If not, macOS may prompt you to install Command Line Tools.

#### 2.2. Install Git via Homebrew (recommended)

```bash
brew install git
```

#### 2.3. Alternative: Install Command Line Tools only

If you don't want to use Homebrew, you can install Apple's Command Line Tools, which includes Git:

```bash
xcode-select --install
```

A dialog box will appear asking you to install the tools. Click "Install" and follow the prompts.

#### 2.4. Verify Git installation

Close and reopen Terminal, then run:

```bash
git --version
```

You should see: `git version 2.x.x` (or newer)

To check which Git is being used:

```bash
which git
```

If you installed via Homebrew, it should show `/opt/homebrew/bin/git` (Apple Silicon) or `/usr/local/bin/git` (Intel).

#### 2.5. Configure Git

Set up your Git identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 3. Installing Python

macOS comes with Python pre-installed, but it's typically Python 2.7 (on older systems) or an older Python 3 version. It's best to install a current version.

#### 3.1. Check current Python version

```bash
python3 --version
```

#### 3.2. Install Python via Homebrew (recommended)

```bash
brew install python
```

This installs the latest Python 3.x and pip.

#### 3.3. Alternative: Install from python.org

1. Visit [https://www.python.org/downloads/macos/](https://www.python.org/downloads/macos/)
2. Download the latest stable macOS installer
3. Run the downloaded `.pkg` file
4. Follow the installation wizard
5. The installer will place Python in `/usr/local/bin` or `/Library/Frameworks/Python.framework/`

#### 3.4. Verify Python installation

```bash
python3 --version
```

You should see: `Python 3.x.x`

Check pip:

```bash
pip3 --version
```

You should see: `pip x.x.x from ...`

#### 3.6. Update pip

```bash
pip3 install --upgrade pip
```

### 4. Installing Visual Studio Code

#### 4.1. Install via Homebrew (recommended)

```bash
brew install --cask visual-studio-code
```

#### 4.2. Alternative: Download from website

1. Visit [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Click "Download for macOS"
3. Open the downloaded `.zip` file
4. Drag "Visual Studio Code.app" to your Applications folder
5. Open VS Code from Applications or Spotlight