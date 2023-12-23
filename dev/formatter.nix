{
  config,
  pkgs,
  ...
}: {
  inherit (config.flake-root) projectRootFile;
  package = pkgs.treefmt;

  programs = {
    alejandra.enable = true;
    deadnix.enable = true;
    statix.enable = true;
  };

  settings.formatter.shfmt = {
    command = pkgs.shfmt;
    options = ["-s" "-w"];
    includes = ["*.sh" "*.zsh"];
  };
}
