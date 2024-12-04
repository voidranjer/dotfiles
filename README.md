# My Personal Configuration Dotfiles

```bash
lintian i3ranjer.deb
```


## Instructions to install on Ubuntu-based systems

### 1. Install `git` (if it doesn't already exist):

```bash
sudo apt -y install git
```

### 2. Ensure the source repository ignores any existing folders with the same name to avoid weird recursion problems before cloning:

```bash
echo "dotfiles" >> .gitignore
```

### 3. Clone the dotfiles into a bare repository in the "~/dotfiles" folder of your $HOME:

> Note: This repository is a `bare` repository and should be placed in the `$HOME` directory (the `dotfiles` fish alias in `~/.config/fish/config.fish` expects this repo to be located in `$HOME`).

```bash
git clone --bare https://gitlab.com/ravenjs/dotfiles.git $HOME/dotfiles
```

### 4. Checkout the actual content from the bare repository to your $HOME:

> Note: This alias is the same alias found in `~/.config/fish/config.fish`

```bash
alias dotf='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotf checkout
dotf config --local status.showUntrackedFiles no
```

### 5. Make the `ubuntu-post-installer.sh` script executable and run it with root:

```bash
sudo chmod +x ~/ubuntu-post-installer.sh
sudo bash ~/ubuntu-post-installer.sh
```

## Additional Packages (managed by distribution/DE)

- `zorin-exec-guard` Executable files handler and `.deb` installers
- Notifications

upower -i /org/freedesktop/UPower/devices/battery_macs
mc_battery | grep percentage

https://github.com/PaddiM8/asahi-battery-threshold/issues/3
KERNEL=="macsmc-battery", SUBSYSTEM=="power_supply", ATTR{charge_control_end_threshold}="80", ATTR{charge_control_start_threshold}="78"
