{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  imports = [ flake.inputs.sops-nix.homeManagerModules.sops ];

  options = modules.option "sops-nix.core";

  config = lib.mkIf (modules.config "sops-nix.core" config) {
    sops.age = {
      keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
