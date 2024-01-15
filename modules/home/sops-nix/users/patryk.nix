{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    home.file = {
      "${config.xdg.configHome}/sops/age/keys.txt".source =
        config.lib.file.mkOutOfStoreSymlink "/etc/sops/age/patryk/keys.txt";
    };
  };
}

