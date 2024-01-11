{ inputs, self, config }:
let
  lib = import ../libraries { inherit inputs; };
  flake = { inherit inputs self lib; };

  rootDirectory = config.ezConfigs.root;
  configurationsDirectory = "${rootDirectory}/configurations";
  modulesDirectory = "${rootDirectory}/modules";
in {
  root = ./..;

  globalArgs = { inherit flake; };

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
