{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "nix.settings" config) {
    nix = {
      gc = {
        automatic = true;
        options = "--delete-older-than 7d";
      };

      nixPath = [ "nixpkgs=${pkgs.path}" "home-manager=flake:home" ];

      registry = { home.flake = flake.inputs.home-manager; };
    };
  };
}
