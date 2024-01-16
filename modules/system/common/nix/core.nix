{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nix.core";

  config = lib.mkIf (modules.config "nix.core" config) {
    nix = {
      settings = {
        keep-outputs = true;
        keep-derivations = true;
        builders-use-substitutes = true;

        experimental-features = [ "flakes" "nix-command" "repl-flake" ];

        fallback = true;
        warn-dirty = false;
      };

      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
      };

      nixPath = [ "nixpkgs=${pkgs.path}" "home-manager=flake:home" ];

      registry = { home.flake = flake.inputs.home-manager; };
    };

    nixpkgs.config.allowUnfree = true;
  };
}
