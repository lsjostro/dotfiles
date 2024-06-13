set fish_greeting
set fish_emoji_width 2

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/bin

## Nix
#set -gx LOCALE_ARCHIVE /usr/lib/locale/locale-archive
set -gx NIX_REMOTE daemon
set -gx NVIM_LISTEN_ADDRESS $XDG_RUNTIME_DIR/nvim.sock
set -gx SSH_ASKPASS /usr/lib/ssh/gnome-ssh-askpass4
fish_add_path $HOME/.nix-profile/bin

if status is-interactive

    ## Pager
    set -gx LESS "--mouse --wheel-lines=1 -nRXF"
    set -gx LESSCOLORIZER bat
    set -gx LESSOPEN "|lesspipe.sh %s"
    set -gx PAGER bat
    set -gx BAT_PAGER "less -r"

    ## Utilities

    set -gx EDITOR (which nvim)
    set -gx VISUAL $EDITOR
    set -gx SUDO_EDITOR $EDITOR

    function tree
        eza --tree --color=always $argv | bat --wrap=never
    end

    function rg --wraps rg --description 'ripgrep with bat'
        /usr/bin/rg --color=always $argv | bat --wrap=never
    end

    ## Directory jumping with frecency 

    function fre_after_cd --on-variable PWD
        fre --add "$PWD"
    end

    function jump
        set _dir $(fre --sorted | fzf-tmux --no-sort -p 90%,40% -y 0 -- -e)
        [ -n "$_dir" ] && pushd $_dir >>/dev/null
        commandline -f repaint
    end
    bind \cg jump

    function git_jump
        set _dir $(git rev-parse --show-toplevel 2>/dev/null || pwd)
        [ -n "$_dir" ] && pushd $_dir >>/dev/null
        commandline -f repaint
    end
    bind \c_ git_jump

    ## Kubernetes
    fish_add_path $HOME/.krew/bin
    # function kubectl --wraps kubectl
    #     command kubecolor $argv
    # end

    ## History

    # FIXME: how to use autin history for these?
    #bind \cn history-prefix-search-forward
    #bind \cp history-prefix-search-backward
    bind \cP _atuin_bind_up
    bind \cJ forward-char

    atuin init fish | source
    starship init fish | source
end

## Direnv
direnv hook fish | source
