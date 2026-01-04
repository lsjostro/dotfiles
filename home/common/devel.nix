{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age-plugin-fido2-hmac
    comma
    doggo
    file
    just
    nix-output-monitor
    passage
    rage
  ];
}
