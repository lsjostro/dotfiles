{ lib, ... }:
{
  imports = [
    ./nix.nix
    ./utils.nix
    ./nvim
    ./fish.nix
  ];
}
