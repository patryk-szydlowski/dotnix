{ flake, config, lib, ... }:
let
  inherit (flake.lib) modules;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  config = lib.mkIf (modules.config "sops-nix.users.patryk" config) {
    home.file = {
      "${config.xdg.configHome}/sops/age/keys.txt".source =
        mkOutOfStoreSymlink "/etc/sops/age/patryk/keys.txt";
        
      "${config.home.homeDirectory}/.ssh/patryk-szydlowski@github".source =
        mkOutOfStoreSymlink "/etc/sops/ssh/patryk/patryk-szydlowski@github";
    };
  };
}

