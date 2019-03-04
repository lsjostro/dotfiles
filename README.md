## Init dotfiles

```bash
# Arch Linux packages

# prereqs
pacman -S base-devel git wget dialog wpa_supplicant iw
# AUR packages
wget -qO- https://github.com/Jguer/yay/releases/download/v9.0.1/yay_9.0.1_x86_64.tar.gz | tar xvz && yay*/yay -S yay-bin

# Essentials
yay -S xorg xorg-xinit xinit-xsession xf86-video-intel xf86-input-libinput \
  libinput alsa-utils pulseaudio libnotify maim lightdm-gtk-greeter acpi \
  powertop go openssh fasd direnv zsh neovim neovim-remote python-neovim tmux \
  alacritty ttf-google-fonts-git ttf-ibm-plex fzf rofi redshift lastpass-cli \
  htop dunst google-chrome-beta kubectl-bin diff-so-fancy xdg-utils aws-cli \
  google-cloud-sdk bazel ripgrep i3lock pygmentize python-pygments \
  python-pygments-style-solarized docker flatpak keybase-bin

# Init git repo
git clone https://github.com/lsjostro/dotfiles.git $HOME/.dot_git --bare && \
  git --work-tree $HOME --git-dir $HOME/.dot_git checkout --force && \
  mkdir -p $HOME/.dot_git/info && echo '*' > $HOME/.dot_git/info/exclude

# Install plugins
nvim -c ":PlugInstall"
nvim -c ":GoInstallBinaries"

# enable user systemd units
systemctl --user enable ssh-agent
systemctl --user enable oidc-agent
systemctl --user enable dunst
systemctl --user enable redshift
```
