{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.security.ssh";

  config = lib.mkIf (modules.config "home-manager.security.ssh" config) {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    programs.keychain.enable = true;

    services.ssh-agent.enable = true;
  };
}
