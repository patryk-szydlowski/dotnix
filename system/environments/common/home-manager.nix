{inputs, inputs', ...}: {
  imports = [inputs.home-manager.nixosModules.default];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs inputs';};
  };
}
