{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    flake-root.url = "github:srid/flake-root";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    ez-configs.url = "github:ehllie/ez-configs";
    ez-configs.inputs.nixpkgs.follows = "nixpkgs";
    ez-configs.inputs.flake-parts.follows = "flake-parts";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ config, ... }: {
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      imports = [
        inputs.flake-parts.flakeModules.easyOverlay
        inputs.flake-root.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.ez-configs.flakeModule
      ];

      ezConfigs = import ./repo/ez-configs.nix { inherit inputs self config; };

      perSystem = { system, config, pkgs, ... }: {
        treefmt = import ./repo/treefmt.nix { inherit config pkgs; };
        overlayAttrs = import ./overlays { inherit pkgs; };

        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      };
    });
}
