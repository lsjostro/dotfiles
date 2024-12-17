{ lib, ... }:
{
  imports = [
    ./nix.nix
    ./atuin.nix
    ./devel.nix
    ./utils.nix
    ./nvim
    ./fish.nix
    ./ssh.nix
    ./k8s.nix
    ./tmux.nix
    ./vcs.nix
  ];
}
