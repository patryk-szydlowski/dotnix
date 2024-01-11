{ pkgs }: {
  editorconfig-checker = import ./editorconfig-checker.nix { inherit pkgs; };
}
