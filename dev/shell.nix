{lib, ...}: {
  languages = {
    nix.enable = true;
  };

  pre-commit.hooks = {
    editorconfig-checker.enable = true;
  };

  containers = lib.mkForce {};
}
