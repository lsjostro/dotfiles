## Init dotfiles

```bash
# Arch Linux packages

# prereqs
pacman -S base-devel git wget dialog
# AUR packages
wget -qO- https://github.com/Jguer/yay/releases/download/v9.0.1/yay_9.0.1_x86_64.tar.gz | tar xvz && yay*/yay -S yay-bin 

# Essentials
yay -S xorg xorg-xinit xinit-xsession xf86-video-intel xf86-input-libinput libinput alsa-utils pulseaudio maim lightdm-gtk-greeter acpi powertop wpa_supplicant go openssh fasd direnv zsh neovim neovim-remote python-neovim tmux alacritty ttf-google-fonts-git fzf rofi redshift lastpass-cli dunst google-chrome-beta kubectl-bin diff-so-fancy xdg-utils google-cloud-sdk ripgrep i3lock

# Init git repo
git clone https://github.com/lsjostro/dotfiles.git $HOME/.dot_git --bare && \
  git --work-tree $HOME --git-dir $HOME/.dot_git checkout --force && \
  mkdir -p $HOME/.dot_git/info && echo '*' > $HOME/.dot_git/info/exclude

# Install plugins
pip3 install Pygments pygments-style-solarized
nvim -c ":PlugInstall"
nvim -c ":GoInstallBinaries"

# enable user systemd units
systemctl --user enable ssh-agent
systemctl --user enable oidc-agent
systemctl --user enable dunst
systemctl --user enable redshift
```
