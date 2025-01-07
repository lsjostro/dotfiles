{ ... }:
let
  realName = "Lars Sjöstrom";
  email = "lars@radicore.se";
in
{
  home = {
    username = "lsjostro";
    homeDirectory = "/home/lsjostro";
  };

  programs.git = {
    userName = realName;
    userEmail = email;
  };

  programs.jujutsu = {
    settings.user.email = email;
    settings.user.name = realName;
    settings.git.push-bookmark-prefix = "lsjostro/push-";
    settings.signing.backends.ssh.allowed-signers = "/home/lsjostro/.ssh/authorized_keys";
    settings.signing.key = "/home/lsjostro/.ssh/git_signing_key.pub";
  };

  home.stateVersion = "25.05"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
