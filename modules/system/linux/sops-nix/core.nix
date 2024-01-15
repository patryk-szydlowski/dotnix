{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  imports = [ flake.inputs.sops-nix.nixosModules.sops ];

  options = modules.option "sops-nix.core";

  config = lib.mkIf (modules.config "sops-nix.core" config) {
    sops.age = {
      keyFile = "/etc/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
