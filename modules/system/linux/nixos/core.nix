{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nixos.core";

  config = lib.mkIf (modules.config "nixos.core" config) {
    users.mutableUsers = false;

    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
