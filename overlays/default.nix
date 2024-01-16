{ inputs, pkgs }: {
  editorconfig-checker = import ./editorconfig-checker.nix { inherit pkgs; };
  treefmt = import ./treefmt.nix { inherit inputs pkgs; };
}
