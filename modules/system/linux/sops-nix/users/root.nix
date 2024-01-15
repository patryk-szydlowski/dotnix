{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "sops-nix.users.root" config) {
    users.users.root = {
      hashedPasswordFile = config.sops.secrets."root.password.hashed".path;
    };

    sops.secrets = { "root.password.hashed".neededForUsers = true; };
  };
}

