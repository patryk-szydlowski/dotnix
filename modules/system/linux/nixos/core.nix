{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nixos.core";

  config = lib.mkIf (modules.config "nixos.core" config) {
    nix = {
      settings = {
        sandbox = true;
        auto-optimise-store = true;
        allowed-users = [ "root @wheel" ];
        trusted-users = [ "root @wheel" ];
      };

      optimise.automatic = true;
    };

    users.mutableUsers = false;

    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
