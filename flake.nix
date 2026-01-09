{
  description = "NixOS configuration";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";
    zjstatus.url = "github:dj95/zjstatus";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-index-database,
      home-manager,
      zjstatus,
      ...
    }:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      overlay = import ./overlays { inherit inputs outputs; };

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };

      mkHome =
        modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            nix-index-database.hmModules.nix-index
            ./home/common
          ]
          ++ modules;
        };
    in
    {
      formatter = pkgs.nixpkgs-fmt;

      devShell.${system} = pkgs.mkShell {
        packages = with pkgs; [
          just
          nh
          nixd
          nixfmt
        ];
      };

      nixosConfigurations = { };

      homeConfigurations = {
        "lsjostrom@dele" = mkHome [ ./home/lsjostrom/dev.nix ];
        "lsjostro@nemo" = mkHome [ ./home/lsjostrom/nemo.nix ];
      };
    };
}
