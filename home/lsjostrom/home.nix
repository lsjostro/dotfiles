{ pkgs, ... }:
{
  home = {
    username = "lsjostrom";
    homeDirectory = "/home/lsjostrom";
  };

  programs.git = {
    userName = "Lars Sjöstrom";
    userEmail = "lars@radicore.se";
  };

  programs.jujutsu = {
    settings = {
      lsjostrom = {
        user = "Lars Sjöstrom";
        email = "lars@radicore.se";
      };
    };
  };

  programs.ssh.matchBlocks = {
    dev = {
      hostname = "dev.local";
      forwardAgent = true;
      localForwards = [
        {
          bind.address = "localhost";
          bind.port = 8000;
          host.address = "localhost";
          host.port = 8000;
        }
        {
          bind.address = "localhost";
          bind.port = 8080;
          host.address = "localhost";
          host.port = 8080;
        }
      ];
    };
  };

  home.stateVersion = "25.05"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
