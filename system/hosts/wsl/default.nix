{
  imports = [
    ../../environments/common
    ../../environments/wsl
    ../../environments/wsl/vscode.nix
    ./users.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  wsl.wslConf.network.hostname = "wsl";
}
