{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.default];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
