{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nixos-vscode-server.wsl";

  config = lib.mkIf (modules.config "nixos-vscode-server.wsl" config) {
    wsl.extraBin = [
      { src = "${pkgs.coreutils}/bin/uname"; }
      { src = "${pkgs.coreutils}/bin/dirname"; }
      { src = "${pkgs.coreutils}/bin/readlink"; }
    ];
  };
}
