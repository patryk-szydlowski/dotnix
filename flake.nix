{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-root.url = "github:srid/flake-root";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixos-wsl.url = "github:nix-community/nixos-wsl";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    nixos-vscode-server.url = "github:nix-community/nixos-vscode-server";
    nixos-vscode-server.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        inputs.flake-root.flakeModule
        inputs.devenv.flakeModule
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = system @ {pkgs, ...}: {
        treefmt.config = import ./dev/formatter.nix {inherit (system) config pkgs;};
        devenv.shells.default = ./dev/shell.nix;
        checks.devenv = system.config.devenv.shells.default.ciDerivation;
      };

      flake = {
        nixosConfigurations = {
          wsl = inputs.nixpkgs.lib.nixosSystem {
            modules = [./system/hosts/wsl];
            specialArgs = {inherit inputs;};
          };
        };

        homeConfigurations = {
          "patryk@wsl" = inputs.home-manager.lib.homeManagerConfigurations {
            modules = [./home/users/partyk/wsl.nix];
            extraSpecialArgs = {inherit inputs;};
          };
        };
      };
    };
}
