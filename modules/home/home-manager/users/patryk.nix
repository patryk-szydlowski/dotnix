{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.users.patryk";

  config = lib.mkIf (modules.config "home-manager.users.patryk" config) {
    programs.git.includes = [{
      condition = "gitdir:~/projects/patryk-szydlowski/";
      contents = {
        user = {
          name = "Patryk Szydłowski";
          email = "no-reply@patrykszydlowski.com";
          signingKey = "~/.ssh/patryk-szydlowski@github";
        };
      };
    }];

    programs.ssh.matchBlocks = {
      "patryk-szydlowski@github" = {
        host = "github.com";
        hostname = "github.com";
        identityFile = "~/.ssh/patryk-szydlowski@github";
      };
    };
  };
}
