{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "sops-nix.users.root";

  config = lib.mkIf (modules.config "sops-nix.users.root" config) {
    sops.secrets = {
      "root.password.hashed" = {
        key = "password/hashed";
        sopsFile = ./root.secrets.yaml;
      };
    };
  };
}

