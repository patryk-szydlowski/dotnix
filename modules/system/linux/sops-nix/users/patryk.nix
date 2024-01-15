{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    users.users.patryk = {
      hashedPasswordFile = config.sops.secrets."patryk.password.hashed".path;
    };

    sops.secrets = {
      "patryk.password.hashed".neededForUsers = true;
    };
  };
}

