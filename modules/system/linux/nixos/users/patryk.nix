{ flake, config, lib, pkgs, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nixos.users.patryk";

  config = lib.mkIf (modules.config "nixos.users.patryk" config) {
    programs.fish.enable = true;

    users.users.patryk = {
      name = "patryk";
      home = "/home/patryk";
      createHome = true;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };
}
