{
  ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
    #FIXME: Neotest is marked broken. (remove when fixed.)
    config.allowBroken = true;
  };
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
