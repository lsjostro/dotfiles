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
zi load zsh-users/zsh-syntax-highlighting
zi ice wait lucid
zi load zsh-users/zsh-history-substring-search

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
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES

# Key bindings
bindkey -e
bindkey '^r' history-incremental-search-backward
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^g' _jump

# Exports
export NVIM_LISTEN_ADDRESS=$XDG_RUNTIME_DIR/nvim.sock
export EDITOR=nvim
export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/bin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.krew/bin:$HOME/.local/bin
export LESS="--mouse --wheel-lines=1 -nRX"
export FZF_TMUX=1
export FZF_COMPLETION_TRIGGER=";"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
export RIPGREP_CONFIG_PATH=${HOME}/.config/rg/rg.conf
export GOPROXY=https://proxy.golang.org/
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
[ -f ~/.private.zsh ] && source "$HOME/.private.zsh"

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

# completions
command -v gcloud >/dev/null 2>&1 && source /opt/google-cloud-sdk/completion.zsh.inc
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# prompt
eval "$(starship init zsh)"

# autoload
autoload bashcompinit && bashcompinit

# zsh functions
function zoom-join() {
	_store="zoom_rooms"
	if [ -n "$1" ]; then
		_id=$1
	else
		_id=$(fre --store_name $_store --sorted | fzf-tmux)
	fi
	[ -n "$_id" ] && fre --store_name $_store --add "$_id" &&
		xdg-open "https://${ZOOM_DOMAIN}.zoom.us/wc/join/$_id"
}

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
# vim:set ft=sh:
