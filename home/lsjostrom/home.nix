{ config, ... }:
let
  realName = "Lars Sjöstrom";
  email = "lars@radicore.se";
in
{
  home = {
    username = "lsjostrom";
    homeDirectory = "/home/lsjostrom";
  };

  programs.git = {
    settings = {
      user.name = realName;
      user.email = email;
    };
  };

  programs.jujutsu = {
    settings.user.email = email;
    settings.user.name = realName;
    settings.templates.git_push_bookmark = ''"lsjostro/push-" ++ change_id.short()'';
    settings.signing.backends.ssh.allowed-signers = "/home/lsjostrom/.ssh/authorized_keys";
    settings.signing.key = "/home/lsjostrom/.ssh/git_signing_key.pub";
  };

  home.stateVersion = "25.05"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion

  # age = {
  #   identityPaths = [
  #     "${config.home.homeDirectory}/.age/id-dotfiles"
  #   ];
  #   secrets = {
  #     "codestral_api_key" = {
  #       file = ../../secrets/codestral_api_key.age;
  #     };
  #   };
  # };

}
