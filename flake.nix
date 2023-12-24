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

    nix-colors.url = "github:misterio77/nix-colors";

    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({withSystem, ...}: {
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
          wsl = withSystem "x86_64-linux" (system:
            inputs.nixpkgs.lib.nixosSystem {
              modules = [./system/hosts/wsl];
              specialArgs = {
                inherit inputs;
                inherit (system) inputs';
              };
            });
        };

        homeConfigurations = {
          "patryk@wsl" = withSystem "x86_64-linux" (system:
            inputs.home-manager.lib.homeManagerConfiguration {
              inherit (system) pkgs;
              modules = [./home/users/patryk/wsl.nix];
              extraSpecialArgs = {
                inherit inputs;
                inherit (system) inputs';
              };
            });
        };
      };
    });
}
