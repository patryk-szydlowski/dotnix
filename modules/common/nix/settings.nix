{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nix.settings";

  config = lib.mkIf (modules.config "nix.settings" config) {
    nix.settings = {
      keep-outputs = true;
      keep-derivations = true;
      builders-use-substitutes = true;

      experimental-features = [ "flakes" "nix-command" "repl-flake" ];

      fallback = true;
      warn-dirty = false;
    };

    nixpkgs.config.allowUnfree = true;
  };
}
