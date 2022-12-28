# My Personal Configuration Dotfiles

## Instructions to install on Ubuntu-based systems

### 1. Install `git` (if it doesn't already exist)
```bash
sudo apt install git
```

### 2. Clone this repository to the `$HOME` directory
> Note: This repository is a `bare` repository and should be placed in the `$HOME` directory (the `dotfiles` fish alias in `~/.config/fish/config.fish` expects this repo to be located in `$HOME`).
```bash
cd ~
git clone https://gitlab.com/ravenjs/dotfiles.git
```

### 3. Make the `ubuntu-post-installer.sh` script executable and run it with root.
```bash
sudo chmod +x ~/ubuntu-post-installer.sh
sudo bash ~/ubuntu-post-installer.sh
```