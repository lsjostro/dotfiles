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
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    ragenix.url = "github:yaxitech/ragenix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-index-database,
      ragenix,
      home-manager,
      ...
    }:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHome =
        modules:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            nix-index-database.hmModules.nix-index
            # ragenix.homeManagerModules.default
            ./home/common
          ]
          ++ modules;
        };
    in
    {
      overlays = import ./overlays { inherit inputs outputs; };

      formatter = pkgs.nixpkgs-fmt;

      devShell.${system} = pkgs.mkShell {
        packages = with pkgs; [
          just
          nh
          nixd
          nixfmt-rfc-style
          # (inputs.ragenix.packages.${system}.default.override { plugins = [ age-plugin-tpm ]; })
        ];
      };

      nixosConfigurations = { };

      homeConfigurations = {
        "lsjostrom@dele" = mkHome [ ./home/lsjostrom/dev.nix ];
        "lsjostro@nemo" = mkHome [ ./home/lsjostrom/nemo.nix ];
      };
    };
}
