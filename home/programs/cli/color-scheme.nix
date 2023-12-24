{
  inputs,
  config,
  pkgs,
  ...
}: let
  nix-colors-lib = inputs.nix-colors.lib.contrib {inherit pkgs;};
in {
  programs.zsh.initExtra = ''
    sh ${nix-colors-lib.shellThemeFromScheme {scheme = config.colorScheme;}}
  '';
}
