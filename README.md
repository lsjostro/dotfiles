## Init dotfiles

```bash
# Init git repo
git clone https://github.com/lsjostro/dotfiles.git $HOME/.dot_git --bare && \
  git --work-tree $HOME --git-dir $HOME/.dot_git checkout --force && \
  mkdir -p $HOME/.dot_git/info && echo '*' > $HOME/.dot_git/info/exclude

# Arch Linux packages
# prereqs
sudo pacman -S base-devel git wget iwd iw sudo
# AUR packages
wget -qO- https://github.com/Jguer/yay/releases/download/v9.0.1/yay_9.0.1_x86_64.tar.gz | tar xvz && yay*/yay -S yay-bin

# Essentials
yay -S xorg xorg-xinit xinit-xsession xf86-video-intel xf86-input-libinput feh \
  libinput alsa-utils pulseaudio libnotify maim lightdm python-gobject acpi \
  powertop go openssh fasd direnv zsh neovim neovim-remote python-neovim tmux \
  alacritty ttf-google-fonts-git ttf-ibm-plex jq fzf rofi redshift lastpass-cli \
  htop dunst google-chrome-beta kubectl-bin diff-so-fancy xdg-utils aws-cli \
  google-cloud-sdk bazel ripgrep i3lock pygmentize python-pygments spotify \
  python-pygments-style-solarized docker flatpak keybase-bin yarn terminus-font \
  jsonnet kubectx ttf-emojione-color noto-fonts-emoji stern-bin

cat << EOF | sudo tee /etc/systemd/network/25-wireless.network
[Match]
Name=wlp2s0

[Network]
DHCP=ipv4
EOF

# enable systemd units
sudo systemctl enable iwd
sudo systemctl enable systemd-networkd
sudo systemctl enable systemd-resolved

# Install plugins
nvim -c ":PlugInstall"
nvim -c ":CocInstall coc-yaml coc-json"

# install language servers
go get github.com/saibing/bingo
yarn global add dockerfile-language-server-nodejs
yarn global add bash-language-server

#keybase
keybase login
keybase config set mountdir $HOME/kbfs

# enable user systemd units
systemctl --user enable kbfs
systemctl --user enable ssh-agent
systemctl --user enable dunst
systemctl --user enable redshift

# additional groups
sudo groupadd autologin
sudo gpasswd -a $USER docker
sudo gpasswd -a $USER autologin
```
