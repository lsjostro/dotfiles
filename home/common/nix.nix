{ pkgs
, outputs
, ...
}:
{
  nixpkgs = {
    config.allowUnfree = true;
  };
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}

