# My Personal Configuration Dotfiles

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
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

### 5. Make the `ubuntu-post-installer.sh` script executable and run it with root:
```bash
sudo chmod +x ~/ubuntu-post-installer.sh
sudo bash ~/ubuntu-post-installer.sh
```

## TODO
- Include a table in the markdown files explaining the function of each script/directory/file and package in the packages.txt file
- In the table, include all locations in which the packages are dependencies (mimeapps.list -> firefox, eog) (everything else -> i3/config)

## Packages
|    **Package**   |                                                                                                                            **Description**                                                                                                                            |     **Locations**     | **Source** |
|:----------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:---------------------:|:----------:|
|       fish       |                                                                                  `fish` is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family.                                                                                 | `~/.config/i3/config` |     APT    |
|       rofi       |                                                           Window switcher, run dialog and dmenu replacement. `rofi` can act as an application launcher, window switcher, ssh launcher and dmenu replacement.                                                          | `~/.config/i3/config` |     APT    |
|     nitrogen     |                                                                                     `nitrogen` is a graphical wallpaper utility that can be used in two modes, browser and recall.                                                                                    | `~/.config/i3/config` |     APT    |
|       picom      |                           `compton` is a compositor for X11, based on xcompmgr. In addition to shadows, fading and translucency, compton implements window frame opacity control, inactive window transparency, and shadows on argb windows.                          | `~/.config/i3/config` |     APT    |
|      arandr      |                                          `ARandR` is a visual front end for XRandR, which provides full control over the relative positioning and rotation of monitors, as well as saving and loading to/from shell scripts.                                          | `~/.config/i3/config` |     APT    |
|      i3-gaps     | This metapackage installs the i3-gaps window manager (i3-gaps-wm), xsession, the i3lock screen locker, i3status (for system information) and suckless-tools (for dmenu). *Note: The `i3-gaps` package will soon be deprecated and shipped with the core i3 wm package | `~/.config/i3/config` |     PPA    |
|   redshift-gtk   |                                                                                                   Adjusts the color temperature of your screen with GTK+ integration                                                                                                  | `~/.config/i3/config` |     APT    |
| gnome-screenshot |                                                                                                                    screenshot application for GNOME                                                                                                                   | `~/.config/i3/config` |     APT    |

## Additional Packages (managed by distribution/DE)
- `zorin-exec-guard` Executable files handler and `.deb` installers
- 