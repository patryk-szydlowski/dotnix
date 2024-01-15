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

      "patryk.age.keys.private" = {
        key = "age/keys/private";
        sopsFile = ./patryk.secrets.yaml;
      };

      "patryk.ssh.keys.private" = {
        key = "ssh/keys/private";
        sopsFile = ./patryk.secrets.yaml;
      };
    };
  };
}

