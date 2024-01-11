{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.users.patryk";

  config = lib.mkIf (modules.config "home-manager.users.patryk" config) {
    programs.git = {
      userName = "Patryk Szydłowski";
      userEmail = "no-reply@patrykszydlowski.com";
    };
  };
}
