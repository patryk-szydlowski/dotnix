{lib, ...}: {
  containers = lib.mkForce {};

  languages = {
    nix.enable = true;
  };

  pre-commit.hooks = {
    editorconfig-checker.enable = true;
  };
}
