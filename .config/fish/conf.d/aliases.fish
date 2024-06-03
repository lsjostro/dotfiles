alias e='tmux-edit-helper'
alias dotgit='git --work-tree $HOME --git-dir $HOME/.dot_git'
#alias git='git-branchless wrap --'
alias l='bat --wrap=never --pager="less -S"'
alias ls=eza
alias tail='tail -n $LINES'
alias timestamp='TZ=Z date "+%Y%m%dT%H%M%SZ"'
alias top='btm --basic --enable_cache_memory --enable_gpu_memory --battery'
alias w="history -1 | sed -e 's/[0-9]*  //' | xargs viddy -n1"
alias xc=fish_clipboard_copy
