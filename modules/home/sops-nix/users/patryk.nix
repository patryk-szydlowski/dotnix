{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    sops.secrets = {
      "patryk.age.keys.private" = {
        path = "${config.xdg.configHome}/sops/age/keys.txt";
      };

      "patryk.ssh.keys.patryk-szydlowski@github.private" = {
        path = "${config.home.homeDirectory}/.ssh/patryk-szydlowski@github";
      };
    };
  };
}

