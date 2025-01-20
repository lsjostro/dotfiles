{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age-plugin-fido2-hmac
    comma
    dogdns
    file
    just
    nix-output-monitor
    passage
    rage
  ];
}
