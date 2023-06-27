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
zi load zsh-users/zsh-history-substring-search
zi ice wait lucid
zi load Aloxaf/fzf-tab
zi ice wait lucid
zi load Freed-Wu/fzf-tab-source

## fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:*' fzf-min-height 30

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

# zsh syntax highlighter
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# typeset -A ZSH_HIGHLIGHT_STYLES

# Key bindings
bindkey -e
bindkey '^r' history-incremental-search-backward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
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
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
alias sudo="doas"
alias e='tmux-edit-helper'
alias kubectl='grc kubectl'
alias top='btm --basic --enable_cache_memory --enable_gpu_memory --battery --color=default'

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
eval "$(starship init zsh)"

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
