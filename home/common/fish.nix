{ lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "transient";
        src = pkgs.fishPlugins.transient-fish.src;
      }
    ];

    functions = {
      confirm = {
        description = "Ask for confirmation";
        argumentNames = [ "message" ];
        body = ''
          	          read -l -p 'printf "\\e[31;1m$message\\e[0m (y/N) "' confirm
          	          test "$confirm" = 'y'
          	        '';
      };

      poweroff = {
        description = "Wraps poweroff to first prompt for confirmation";
        wraps = "poweroff";
        body = ''confirm "⚠ Really poweroff $(hostname)?" && command poweroff $argv'';
      };

      reboot = {
        description = "Wraps reboot to first prompt for confirmation";
        wraps = "reboot";
        body = ''confirm "⚠ Really reboot $(hostname)?" && command reboot $argv'';
      };

      shutdown = {
        description = "Wraps shutdown to first prompt for confirmation";
        wraps = "shutdown";
        body = ''confirm "⚠ Really shutdown $(hostname)?" && command shutdown $argv'';
      };

      tmux-refresh-env = {
        description = "Refresh environment variables from tmux session";
        body = ''
          	          for var in (tmux show-environment | string match -rv '^-')
          	            set -l parts (string split -m 1 '=' $var)
          	            if test (count $parts) -eq 2
          	              set -Ux $parts[1] $parts[2]
          	            end
          	          end
          	        '';
      };

      # edit = {
      #   description = "Open a file in already running nvim and switch tab";
      #   argumentNames = [ "file" ];
      #   body = ''
      #     	          set _file (readlink -f "$file")
      #     	          if test -z "$file"
      #     	              set _root (vcs_root)
      #     	              set _file (fd --type f . "$_root" | sed -e "s#^$_root/##" | fzf --no-sort --layout=reverse)
      #     	              set _file "$_root/$_file"
      #     	          end
      #     	          set _nvim_socket "$XDG_RUNTIME_DIR/nvim-persistent.sock"
      #     	          if test -S "$_nvim_socket" && tmux select-window -t nvim 2>/dev/null
      #     	            nvim --server "$_nvim_socket" --remote "$_file"
      #     	            return 0
      #     	          end
      #     	          tmux new-window -S -n nvim nvim --listen "$_nvim_socket" "$_file"
      #     	        '';
      # };

      jl.body = ''
        	        jj log --color=always --no-graph -T builtin_log_oneline -r 'all()' | fzf --ansi --reverse --wrap --preview 'jj show --tool=difftu {1}' --preview-window=down,70% --color=light
        	      '';

      __zoxide_zi_repaint.body = ''
        	        __zoxide_zi
        	        commandline -f repaint
        	      '';

      fish_jj_prompt.body = ''
        	        if not command -sq jj || not jj root --quiet &>/dev/null
        	          return 1
        	        end

        	      jj log --ignore-working-copy --no-graph --color never -r @ -T '
        	        surround(
        	          " \e[2;3m",
        	          "\e[0m",
        	          separate(
        	            " ",
        	            surround(
        	              "\e[0;2;3m",
        	              "\e[0m",
        	              coalesce(
        	                surround(
        	                  "\e[1;2;3m❝",
        	                  "❞\e[0m",
        	                  if(
        	                    description.first_line().substr(0, 80).starts_with(description.first_line()),
        	                    description.first_line().substr(0, 80),
        	                    description.first_line().substr(0, 79) ++ "…"
        	                  )
        	                ),
        	                "…"
        	              ),
        	            ),
        	            surround("\e[0;1;95m ", "\e[0;2;3m", change_id.shortest()),
                    surround("\e[0;35m󰸕 ", "\e[0m", bookmarks.join("╱")),
        	            surround("\e[0;34m ",   "\e[0;2;3m", commit_id.shortest()),
        	            if(conflict,  "󰂭"),
        	            if(empty,     ""),
        	            if(divergent, ""),
        	            if(hidden,    "󰘓"),
        	          )
        	        )
        	      '
        	      '';

      fish_prompt.body = ''
        	        echo -e "\033[s\033[$LINES;1H\033[1;2;38;5;238m$(string pad -c '┄' -w $COLUMNS (fish_jj_prompt || fish_vcs_prompt))\033[0m\033[u"
                string join "" -- (set_color --dim) (prompt_hostname) ':' (prompt_pwd --full-length-dirs=4) (set_color --bold normal) ' ❯ ' (set_color normal)
        	      '';

      transient_prompt_func.body = ''
        	        echo
                string join "" -- (set_color --bold) '❯ ' (set_color normal)
        	      '';

      rg.body = ''
        	        if status is-interactive
        	          command rg -p $argv --json | delta
        	        else
        	          command rg $argv
        	        end
        	      '';
    };

    interactiveShellInit = lib.concatStringsSep "\n" [
      (builtins.readFile ../../files/config/fish/config.fish)
      (builtins.readFile ../../files/config/fish/semantic-prompt.fish)
      (builtins.readFile ../../files/config/fish/vcs.fish)
    ];

    shellAbbrs = {
      edit = "hx";
      e = "hx";
      l = "bat";
      top = "btm --basic --enable_cache_memory --battery";
      ts = "TZ=Z date '+%Y%m%dT%H%M%SZ'";
      w = "viddy $history[1]";
      xc = "fish_clipboard_copy";
    };
  };

}
