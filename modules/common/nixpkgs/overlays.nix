{ flake, config, lib, ... }: {
  options = {
    modules.nixpkgs.overlays.enable = lib.mkEnableOption "nixpkgs.overlays";
  };

  config = lib.mkIf config.modules.nixpkgs.overlays.enable {
    nixpkgs.overlays = [ flake.self.overlays.default ];
  };
}
