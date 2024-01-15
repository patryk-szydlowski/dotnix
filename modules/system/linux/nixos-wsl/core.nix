{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  imports = [ flake.inputs.nixos-wsl.nixosModules.wsl ];

  options = modules.option "nixos-wsl.core";

  config = lib.mkIf (modules.config "nixos-wsl.core" config) {
    wsl = {
      enable = true;

      extraBin = [
        { src = "${pkgs.coreutils}/bin/uname"; }
        { src = "${pkgs.coreutils}/bin/dirname"; }
        { src = "${pkgs.coreutils}/bin/readlink"; }
      ];
    };
  };
}
