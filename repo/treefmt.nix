{ config, pkgs }: {
  inherit (config.flake-root) projectRootFile;

  programs.nixfmt.enable = true;
  programs.statix.enable = true;
  programs.deadnix.enable = true;

  settings.formatter = {
    editorconfig-checker = {
      command = pkgs.editorconfig-checker;
      includes = [ "*" ];
    };
  };
}
