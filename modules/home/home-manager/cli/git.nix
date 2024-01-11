{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.git";

  config = lib.mkIf (modules.config "home-manager.cli.git" config) {
    programs.git = {
      enable = true;
      extraConfig = { init.defaultBranch = "main"; };
    };
  };
}
