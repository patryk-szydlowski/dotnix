{
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";

  modules = { nixpkgs.overlays.enable = true; };
}
