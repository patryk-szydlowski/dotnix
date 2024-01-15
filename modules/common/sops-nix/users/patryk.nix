{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "sops-nix.users.patryk";

  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    sops.secrets = {
      "patryk.password.hashed" = {
        key = "password/hashed";
        sopsFile = ./patryk.secrets.yaml;
      };
    };
  };
}

