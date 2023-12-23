{
  pkgs,
  lib,
  ...
}: {
  languages = {
    nix.enable = true;
  };

  packages = [
    pkgs.home-manager
  ];

  pre-commit.hooks = {
    editorconfig-checker.enable = true;
  };

  containers = lib.mkForce {};
}
