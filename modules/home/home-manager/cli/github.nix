{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.github";

  config = lib.mkIf (modules.config "home-manager.cli.github" config) {
    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
