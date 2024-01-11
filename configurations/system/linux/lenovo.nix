{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";

  modules = {
    nix.overlays.enable = true;
    nix.settings.enable = true;
  };
}
