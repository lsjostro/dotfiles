{ ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 0;
    clock24 = true;
    escapeTime = 500;
    mouse = true;
    shortcut = "t";
    extraConfig = ''
      set -g allow-passthrough on
      set -g default-terminal "tmux-256color"
      set -g display-panes-time 3000
      set -g escape-time 10
      set -g history-limit 50000
      set -g set-clipboard on
      set -g set-titles on
      set -g set-titles-string "#H - #T"
      set -g status off
      set -g status-interval 30
      set -g status-style "italics,reverse"
      set -g status-left-length 0
      set -g status-right-length 0
      set -g status-left '#W #{pane_current_path}'
      set -g status-right '%F |  %R'
      set -g status off
      set -g update-environment "SSH_AUTH_SOCK"
      setenv -g "SSH_AUTH_SOCK" "$XDG_RUNTIME_DIR/ssh-agent"
      setw -g alternate-screen on
      setw -g automatic-rename off
      setw -g window-status-format ""
      setw -g window-status-current-format ""
      setw -g window-status-separator ""

      set -s command-alias[1000] stty='run-shell "tmux send-keys \"stty cols #{pane_width} rows #{pane_height}\" Enter"'

      bind -n M-1 if-shell 'tmux select-window -t nvim' refresh-client 'new-window -S -n nvim nvim --listen $XDG_RUNTIME_DIR/nvim-persistent.sock'
      bind -n M-2 if-shell 'tmux select-window -t t1' refresh-client 'new-window -S -n t1'
      bind -n M-3 if-shell 'tmux select-window -t t2' refresh-client 'new-window -S -n t2'
      bind -n M-4 if-shell 'tmux select-window -t t3' refresh-client 'new-window -S -n t3'
      bind -n M-5 if-shell 'tmux select-window -t t4' refresh-client 'new-window -S -n t4'
      bind -n M-6 if-shell 'tmux select-window -t t5' refresh-client 'new-window -S -n t5'
      bind -n M-7 if-shell 'tmux select-window -t t6' refresh-client 'new-window -S -n t6'
      bind -n M-8 if-shell 'tmux select-window -t t7' refresh-client 'new-window -S -n t7'
      bind -n M-9 if-shell 'tmux select-window -t t8' refresh-client 'new-window -S -n t8'
      bind -n M-0 if-shell 'tmux select-window -t t9' refresh-client 'new-window -S -n t9'
      bind -T copy-mode-vi WheelUpPane select-pane \; send-keys -X -N 1 scroll-up
      bind -T copy-mode-vi WheelDownPane select-pane \; send-keys -X -N 1 scroll-down
      bind C-s set-option -g status
      bind-key ] paste-buffer -p
      bind K confirm kill-server
    '';
  };
}
