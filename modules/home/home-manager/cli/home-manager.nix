{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.home-manager";

  config = lib.mkIf (modules.config "home-manager.cli.home-manager" config) {
    programs.home-manager.enable = true;

    news.display = "silent";
  };
}
