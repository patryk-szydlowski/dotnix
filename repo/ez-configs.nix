{ inputs, self, config }:
let
  rootDirectory = config.ezConfigs.root;
  configurationsDirectory = "${rootDirectory}/configurations";
  modulesDirectory = "${rootDirectory}/modules";
in {
  root = ./..;

  globalArgs = { flake = { inherit inputs self; }; };

  nixos = {
    configurationsDirectory = "${configurationsDirectory}/system/linux";
    modulesDirectory = "${modulesDirectory}/system/linux";
  };

  darwin = {
    configurationsDirectory = "${configurationsDirectory}/system/darwin";
    modulesDirectory = "${modulesDirectory}/system/darwin";
  };

  home = {
    configurationsDirectory = "${configurationsDirectory}/home";
    modulesDirectory = "${modulesDirectory}/home";
  };
}
