{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  imports = [ flake.inputs.nix-index-database.hmModules.nix-index ];

  options = modules.option "nix-index-database.core";

  config = lib.mkIf (modules.config "nix-index-database.core" config) {
    programs.nix-index-database.comma.enable = true;
  };
}
