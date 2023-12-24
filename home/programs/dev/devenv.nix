{inputs', ...}: {
  home.packages = [inputs'.devenv.packages.default];
}
