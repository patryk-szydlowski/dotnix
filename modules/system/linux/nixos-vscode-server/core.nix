{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  imports = [ flake.inputs.nixos-vscode-server.nixosModules.default ];

  options = modules.option "nixos-vscode-server.core";

  config = lib.mkIf (modules.config "nixos-vscode-server.core" config) {
    programs.nix-ld.enable = true;

    services.vscode-server.enable = true;

    environment.systemPackages = [ pkgs.wget ];
  };
}
