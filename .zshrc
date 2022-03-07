# =============
#    EXPORT
# =============
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/bin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.krew/bin:$HOME/.local/bin
export LESS="--mouse --wheel-lines=1 -nRX"

export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER=";"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export LPASS_AGENT_TIMEOUT=60

export GOPROXY=https://proxy.golang.org/
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# =============
#    ALIAS
# =============

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
alias icat="wezterm imgcat"
# =============
#    Zplug
# =============
export ZPLUG_HOME=$HOME/.zplug
source /usr/share/zsh/scripts/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "thecasualcoder/kube-fzf", as:command, use:"{*pod,*.sh}"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "arunvelsriram/kube-fzf", use:kube-fzf.sh

# Check if install and load
if ! zplug check; then
    zplug install
fi
zplug load

# ==========================
#    Zsh syntax highlighter
# ==========================
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[alias]='fg=163'

# ==================
#   AUTOCOMPLETION
# ==================
# Kubernetes
command -v kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
command -v stern >/dev/null 2>&1 && source <(stern --completion zsh)

# Google cloud SDK
command -v gcloud >/dev/null 2>&1 && source /opt/google-cloud-sdk/completion.zsh.inc
# Dir env (brew install direnv)
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# =============
#    HISTORY
# =============

## Command history configuration
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

#
# ===================
#    KEY BINDINGS
# ===================
# Use emacs-like key bindings by default:
bindkey -e

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# Substring search plugin
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

redraw-prompt() {
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
bindkey '^g' _jump

function fre_chpwd() {
  fre --add "$(pwd)"
}
typeset -gaU chpwd_functions
chpwd_functions+=fre_chpwd

## Prompt
eval "$(starship init zsh)"

function _title(){
  printf '%-16.16s' "$(starship module directory | sed 's/\x1b\[[0-9;]*m//g')"
}

function set_win_title(){
    echo -ne "\033]0; $(_title) \007"
}
set_win_title

function e {
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ===================
#    Load private
# ===================
[ -f ~/.zsh_private ] && source ~/.zsh_private
