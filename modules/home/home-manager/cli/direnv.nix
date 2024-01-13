
{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.direnv";

  config = lib.mkIf (modules.config "home-manager.cli.direnv" config) {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global.warn_timeout = "5m";
        whitelist.prefix = [ "~/projects" ];
      };
    };
  };
}

