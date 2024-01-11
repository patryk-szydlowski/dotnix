{ pkgs, ... }: {
  projectRootFile = "flake.nix";

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
