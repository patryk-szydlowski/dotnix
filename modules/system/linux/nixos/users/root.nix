{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "nixos.users.root";

  config = lib.mkIf (modules.config "nixos.users.root" config) {
    users.users.root = { uid = 0; };
  };
}
