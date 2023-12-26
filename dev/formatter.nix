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
    shfmt.enable = true;
    shellcheck.enable = true;
  };
}
