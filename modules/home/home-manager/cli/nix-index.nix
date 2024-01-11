{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.nix-index";

  config = lib.mkIf (modules.config "home-manager.cli.nix-index" config) {
    programs.nix-index.enable = true;
  };
}
