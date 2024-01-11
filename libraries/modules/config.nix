{ inputs, path }:
moduleName: config:
let
  inherit (inputs.nixpkgs) lib;

  moduleEnablePath = path moduleName;
  moduleEnableConfig = lib.getAttrFromPath moduleEnablePath config;

in moduleEnableConfig
