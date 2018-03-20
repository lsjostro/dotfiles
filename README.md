## Init dotfiles

```bash
# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Init git repo
git clone https://github.com/lsjostro/dotfiles.git $HOME/.dot_git --bare && \
  git --work-tree $HOME --git-dir $HOME/.dot_git checkout --force && \
  mkdir -p $HOME/.dot_git/info && echo '*' > $HOME/.dot_git/info/exclude

# Install software and plugins
brew bundle
tic ~/etc/xterm-256color-italic.terminfo
pip3 install neovim neovim-remote Pygments pygments-style-solarized
nvim -c ":PlugInstall"
nvim -c ":GoInstallBinaries"

# Precompiled Alacritty binary
curl -LO https://github.com/lsjostro/dotfiles/releases/download/v1.0/Alacritty.app.tar
```
