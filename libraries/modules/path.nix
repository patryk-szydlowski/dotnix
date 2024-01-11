{ inputs }:
moduleName:
let
  inherit (inputs.nixpkgs) lib;

  moduleNamePath = lib.splitString "." moduleName;
  moduleEnablePath = [ "modules" ] ++ moduleNamePath ++ [ "enable" ];

in moduleEnablePath
