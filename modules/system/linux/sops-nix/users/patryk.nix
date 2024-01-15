{ flake, config, lib, ... }:
let
  inherit (flake.lib) modules;
  patryk = config.users.users.patryk.name;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    users.users.patryk = {
      hashedPasswordFile = config.sops.secrets."patryk.password.hashed".path;
    };

    sops.secrets = {
      "patryk.password.hashed".neededForUsers = true;
      "patryk.age.keys.private".owner = patryk;
      "patryk.ssh.keys.patryk-szydlowski@github.private".owner = patryk;
    };

    environment.etc = {
      "sops/age/patryk/keys.txt".source =
        config.sops.secrets."patryk.age.keys.private".path;
        
      "sops/ssh/patryk/patryk-szydlowski@github".source =
        config.sops.secrets."patryk.ssh.keys.patryk-szydlowski@github.private".path;
    };
  };
}

