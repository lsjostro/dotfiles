# zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone --depth=1 https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zi ice wait lucid
zi load zsh-users/zsh-completions
zi ice wait lucid
zi load zdharma-continuum/fast-syntax-highlighting
zi ice wait lucid
zi snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/shrink-path/shrink-path.plugin.zsh

# history
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt HIST_IGNORE_SPACE
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_subst_pattern
setopt hist_verify
setopt share_history

# zsh settings
setopt pipe_fail
setopt auto_pushd
setopt no_beep
setopt no_rm_star_silent
setopt extended_glob
setopt ksh_glob
setopt null_glob

export LC_ALL=en_US.UTF-8

# zsh syntax highlighter
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# typeset -A ZSH_HIGHLIGHT_STYLES
zle_highlight=('paste:none')

source $HOME/.zsh/history.zsh
# Key bindings
bindkey -e
bindkey '^P' my-history-prefix-search-backward-widget
bindkey '^N' my-history-prefix-search-forward-widget
bindkey '^g' _jump

# Exports
export NVIM_LISTEN_ADDRESS=$XDG_RUNTIME_DIR/nvim.sock
export EDITOR=nvim
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/bin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.krew/bin:$HOME/.local/bin
export LESS="--mouse --wheel-lines=1 -nRX"
export LESSCOLORIZER="bat"
export LESSOPEN="|lesspipe.sh %s"
export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER=";"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
export RIPGREP_CONFIG_PATH=${HOME}/.config/rg/rg.conf
export GOPROXY=https://proxy.golang.org/
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export NIX_REMOTE=daemon
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# aliases
alias ls='eza'
alias ll='eza -al --git'
alias tree='eza -T'
alias l=bat
alias vim="nvim"
alias vi="nvim"
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"
alias pbcopy="xclip -selection c"
alias e='tmux-edit-helper'
alias kubectl='grc kubectl'
alias top='btm --basic --enable_cache_memory --enable_gpu_memory --battery --color=default-light'

# completions
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

## bazel
if [ ! -f "${fpath[1]}/_bazel" ]; then
  curl -sLo "${fpath[1]}/_bazel" https://raw.githubusercontent.com/bazelbuild/bazel/master/scripts/zsh_completion/_bazel
fi

# prompt
prompt_chpwd() {
  if [[ ${#PWD} < 25 ]]; then
    PROMPT_PWD="$PWD"
  else
    PROMPT_PWD="$(shrink_path -t -l -e "%{%G\e[2;3;38;5;202m\U2026\e[0;2;3m%}")"
  fi
}
chpwd_functions+=prompt_chpwd

prompt_precmd() {
  PROMPT_LABEL="$HOST"
  print -n '\e[5 q'          # Fix cursor
  print -n "\e]7;${PWD}\a"   # OSC 7 for terminal pwd
}
precmd_functions+=(prompt_precmd)

autoload -Uz vcs_info
chpwd_functions+=(vcs_info)
precmd_functions+=(vcs_info)
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%F{#559955} %b%u%c%f '
zstyle ':vcs_info:*' unstagedstr ' %F{#f88}󰦒'
zstyle ':vcs_info:*' stagedstr ' %F{#9ff}󰐖'
setopt PROMPT_SUBST
PROMPT=$'%F{#fff}%K{#543}%{\e[3m%} ${PROMPT_LABEL} %{\e[0m%}%S%F{#543}%k%{%G\Ue0ba%}%k%s%f%{\e[2;3m%}${PROMPT_PWD}%{\e[0m%} ${vcs_info_msg_0_}%# '

# autoload
autoload -Uz compdef
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# zsh functions

# Clipboard OSC 52
function clip() {
  echo -en "\x1b]52;c;$(base64 -w0)\x07"
}

# TMUX passthrough OSC 99 notification
function tnotify() {
  printf "\033Ptmux;\033\033]777;notify;%s;%s\033\\\033\\" "$1" "$2"
}

# bar cursor in wezterm/zsh
function fix_cursor() {
  echo -en '\e[5 q'
}
precmd_functions+=(fix_cursor)

function fre_chpwd() {
	fre --add "$(pwd)"
}
typeset -gaU chpwd_functions
chpwd_functions+=("fre_chpwd")

function redraw-prompt() {
	local precmd
	for precmd in $precmd_functions; do
		$precmd
	done
	zle reset-prompt
}
zle -N redraw-prompt

function _jump() {
	_dir=$(fre --sorted | fzf-tmux --no-sort -p 90%,40% -y 0)
	[ -n "$_dir" ] && pushd "$_dir" >>/dev/null || return 1
	zle && zle redraw-prompt
}
zle -N _jump

function _grc() {
  shift words
  (( CURRENT-- ))
  _normal
}
compdef _grc grc
# vim:set ft=sh:

eval "$(atuin init zsh)"
