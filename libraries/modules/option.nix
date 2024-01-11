{ inputs, path }:
moduleName:
let
  inherit (inputs.nixpkgs) lib;

  moduleEnablePath = path moduleName;
  moduleEnableOption = lib.mkEnableOption moduleName;
  moduleOption = lib.setAttrByPath moduleEnablePath moduleEnableOption;

in moduleOption
