{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "nix.settings" config) {
    nix.gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
}
