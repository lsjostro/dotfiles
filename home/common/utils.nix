{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grc
    dust
    jless
    procs
    viddy
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        italic-text = "always";
        paging = "auto";
        style = "plain";
        theme = "ansi";
      };
    };

    bottom.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = false;
      config.global = {
        hide_env_diff = true;
        load_dotenv = true;
        strict_env = true;
        warn_timeout = "10s";
      };
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
    };

    fd.enable = true;

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    jq.enable = true;
    less.enable = true;
    lesspipe.enable = true;
    tmux.enable = true;

    ripgrep = {
      enable = true;
      arguments = [
        "--glob=!**/.cache/*"
        "--glob=!**/.direnv/*"
        "--glob=!**/.git/*"
        "--glob=!**/.jj/*"
        "--glob=!**/{node_modules,.npm,dist}/*"
        "--glob=!**/target/*"
        "--glob=!**/result/*"
      ];
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd=cd" ];
    };
  };
}
