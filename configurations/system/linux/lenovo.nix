{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";

  wsl.defaultUser = "patryk";
  wsl.wslConf.network.hostname = "lenovo";

  modules = {
    nix.overlays.enable = true;
    nix.settings.enable = true;

    nixos.core.enable = true;
    nixos.users.patryk.enable = true;
    nixos.users.root.enable = true;

    nixos-vscode-server.core.enable = true;

    nixos-wsl.core.enable = true;

    sops-nix.core.enable = true;
  };
}
