{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "nix.core" config) {
    nix = {
      settings = {
        sandbox = true;
        auto-optimise-store = true;
        allowed-users = [ "root @wheel" ];
        trusted-users = [ "root @wheel" ];
      };

      optimise.automatic = true;
    };
  };
}
