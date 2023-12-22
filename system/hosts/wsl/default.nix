{
  nixpkgs,
  nixos-wsl,
  nixos-vscode-server,
  home-manager,
  ...
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    nixos-wsl.nixosModules.wsl
    nixos-vscode-server.nixosModules.default
    home-manager.nixosModules.home-manager
    ../../environments/common
    ../../environments/common/user.nix
    ../../environments/nixos/user.nix
    ../../environments/wsl
    ../../environments/wsl/user.nix
    ../../environments/wsl/vscode.nix
  ];
}
