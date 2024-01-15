{ flake, osConfig, config, lib, ... }:
let
  inherit (flake.lib) modules;
  user = osConfig.users.users.${config.home.username};
  userId = toString user.uid;
in {
  imports = [ flake.inputs.sops-nix.homeManagerModules.sops ];

  options = modules.option "sops-nix.core";

  config = lib.mkIf (modules.config "sops-nix.core" config) {
    sops = {
      age = {
        keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
        generateKey = true;
      };

      defaultSymlinkPath = "/run/user/${userId}/secrets";
      defaultSecretsMountPoint = "/run/user/${userId}/secrets.d";
    };
  };
}
