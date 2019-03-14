# =============
#    EXPORT
# =============
export TERM=xterm-256color
export DISPLAY=:0
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
command -v pygmentize >/dev/null 2>&1 && export LESSOPEN="|pygmentize -f terminal16m -O style=solarizeddark %s"
export LESS=" -R "
export GOPATH=$HOME
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:$HOME/.yarn/bin

export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER=";"
export LPASS_AGENT_TIMEOUT=60

export GO111MODULE=on
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# =============
#    ALIAS
# =============

eval $(dircolors ~/.dircolors/dircolors.256dark)
alias ls='ls --color=auto'
alias ll='ls -al'
alias vim="nvim"
alias vi="nvim"
alias ag='ag --pager less'
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'
alias lp-ssh-pubkey='lpass show --field="Public Key" --clip'
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"

function e {
  tmux select-window -t1
  nvr --remote "$@"
}
function ev {
  tmux select-window -t1
  nvr --remote -O "$@"
}

# =============
#    Zplug
# =============
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
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
command -v kops >/dev/null 2>&1 && source <(kops completion zsh)
command -v helm >/dev/null 2>&1 && source <(helm completion zsh)
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

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history

# =============
#    PROMPT
# =============

autoload -U colors && colors
setopt promptsubst

function short_pwd {
  echo $PWD | sed "s:${HOME}:~:" | sed "s:/\(.\)[^/]*:/\1:g" | sed "s:/[^/]*$:/$(basename $PWD):"
}

local ret_status="%(?:%{$fg_bold[yellow]%}$:%{$fg_bold[red]%}$)"
PROMPT='%{$fg[magenta]%}$(short_pwd)%{$reset_color%} $(git_prompt_info)%{$reset_color%}${ret_status}%{$reset_color%} '
# RPROMPT='%{$fg[yellow]%}$(date +%r)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get customzsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')

  if [[ "$(command git config --get customzsh.hide-dirty)" != "1" ]]; then
    FLAGS+='--ignore-submodules=dirty'
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

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

cd_func () {
  local dir
  if [[ -z "$1" ]]; then
    dir="$HOME"
  else
    dir="$@"
  fi
  "cd" "${dir}"
  fasd -A $PWD
}

alias cd=cd_func
_jump() {
  dir="$(fasd -Rdl | fzf -1 -0 --no-sort +m --height 10)" && cd_func "${dir}"
  zle && zle reset-prompt
}
zle -N _jump
bindkey '^g' _jump

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ===================
#    Load private
# ===================
[ -f ~/.zsh_private ] && source ~/.zsh_private || return 0
