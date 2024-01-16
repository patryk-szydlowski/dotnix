{ config, pkgs, ... }: {
  inherit (config.flake-root) projectRootFile;

  package = pkgs.writeShellApplication {
    name = "treefmt";
    runtimeInputs = [ pkgs.treefmt ];
    text = ''treefmt --hidden "$@"'';
  };

  programs.nixfmt.enable = true;
  programs.statix.enable = true;
  programs.deadnix.enable = true;
  programs.yamlfmt.enable = true;

  settings.formatter = {
    editorconfig-checker = {
      command = pkgs.editorconfig-checker;
      includes = [ "*" ];
    };
  };
}
