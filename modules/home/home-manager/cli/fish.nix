{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.fish";

  config = lib.mkIf (modules.config "home-manager.cli.fish" config) {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -U fish_greeting
      '';
    };
  };
}
