# zplug
export ZPLUG_HOME=$HOME/.zplug
source /usr/share/zsh/scripts/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "thecasualcoder/kube-fzf", as:command, use:"{*pod,*.sh}"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "arunvelsriram/kube-fzf", use:kube-fzf.sh

if ! zplug check; then
    zplug install
fi
zplug load

# Exports
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/bin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.krew/bin:$HOME/.local/bin
export LESS="--mouse --wheel-lines=1 -nRX"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh
export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER=";"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
export RIPGREP_CONFIG_PATH=${HOME}/.config/rg/rg.conf
export GOPROXY=https://proxy.golang.org/
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# aliases
alias ls='exa'
alias ll='exa -al --git'
alias tree='exa -T'
alias l=bat
alias vim="nvim"
alias vi="nvim"
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"
alias pbcopy="xclip -selection c"
alias docker="podman"

# zsh syntax highlighter
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES

# Completion
command -v gcloud >/dev/null 2>&1 && source /opt/google-cloud-sdk/completion.zsh.inc
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
complete -C '/usr/bin/aws_completer' aws

## Prompt
eval "$(starship init zsh)"

## command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000000
SAVEHIST=1000000

#setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history

## zsh settings
setopt pipe_fail
setopt auto_pushd
setopt no_beep
setopt no_rm_star_silent
setopt extended_glob
setopt ksh_glob
setopt null_glob

# KEY BINDINGS
# Use emacs-like key bindings by default:
bindkey -e

bindkey '^r' history-incremental-search-backward
# Substring search plugin
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^g' _jump

function redraw-prompt() {
    local precmd
    for precmd in $precmd_functions; do
        $precmd
    done
    zle reset-prompt
}
zle -N redraw-prompt

function _jump() {
  _dir=$((
      git rev-parse --show-toplevel 2>/dev/null | xargs -r fd --type d --hidden --follow --exclude .git .
      fre --sorted
    ) | fzf-tmux)
  [ -n "$_dir" ] && pushd $_dir >>/dev/null
  zle && zle redraw-prompt
}
zle -N _jump

function fre_chpwd() {
  fre --add "$(pwd)"
}
typeset -gaU chpwd_functions
chpwd_functions+=fre_chpwd

function e() {
  if [ -n "$1" ]; then
    _file=$(readlink -f "$@") 
  else
    _git_root=$(git rev-parse --show-toplevel)
    _store=$(printf $_git_root | sha1sum | cut -d ' ' -f 1)
    _file=$( (fre --store_name $_store --sorted && fd --type f --hidden --follow --exclude .git . $_git_root) | fzf-tmux)
    fre --store_name $_store --add $_file
  fi
  nvr --nostart --remote $_file
  tmux select-window -t1
}

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
