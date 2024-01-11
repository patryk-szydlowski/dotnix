{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nix.overlays";

  config = lib.mkIf (modules.config "nix.overlays" config) {
    nixpkgs.overlays = [ flake.self.overlays.default ];
  };
}
