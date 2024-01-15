{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    users.users.patryk = {
      hashedPasswordFile = config.sops.secrets."patryk.password.hashed".path;
    };

    sops.secrets = {
      "patryk.password.hashed".neededForUsers = true;
      "patryk.age.keys.private".owner = config.users.users.patryk.name;
      "patryk.ssh.keys.private".owner = config.users.users.patryk.name;
    };

    environment.etc = {
      "sops/age/patryk/keys.txt".source =
        config.sops.secrets."patryk.age.keys.private".path;
      "sops/ssh/patryk/id_rsa".source =
        config.sops.secrets."patryk.ssh.keys.private".path;
    };
  };
}

