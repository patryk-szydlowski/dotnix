{inputs, ...}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ./vscode.nix
  ];

  wsl.enable = true;
}
