{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dust
    jless
    procs
    viddy
    delta
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
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };
  home.sessionVariables.EZA_COLORS = "reset:oc=0:ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:su=0:sf=0:xa=0:sn=0:nb=0:nk=0:nm=0:ng=0:nt=0:sb=0:ub=0:uk=0:um=0:ug=0:ut=0:df=0:ds=0:uu=0:uR=0:un=0:gu=0:gR=0:gn=0:lc=0:lm=0:ga=0:gm=0:gd=0:gv=0:gt=0:gi=0:gc=0:Gm=0:Go=0:Gc=0:Gd=0:xx=0:da=0:in=0:bl=0:hd=0:lp=4:cc=0:bO=0:sp=0:mp=0:im=0:vi=0:mu=0:lo=0:cr=0:do=0:co=0:tm=0:cm=0:bu=0:sc=0:ic=0:Sn=0:Su=0:Sr=0:St=0:Sl=0:ff=0:di=1:ex=0:fi=0:pi=0:so=0:bd=0:cd=0:ln=4:or=4";

  home.sessionVariables.DIRENV_LOG_FORMAT = ''$(printf "\033[2mdirenv: %%s\033[0m")'';

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd=cd" ];
  };

  home.sessionVariables._ZO_FZF_OPTS = "--reverse --height=10 --border=rounded --no-info --no-separator --no-scrollbar --no-color --no-sort";
}
