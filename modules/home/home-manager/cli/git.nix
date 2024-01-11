{ flake, config, lib, ... }:
let inherit (flake.lib) modules;
in {
  options = modules.option "home-manager.cli.git";

  config = lib.mkIf (modules.config "home-manager.cli.git" config) {
    programs.git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        commit.gpgSign = true;
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        user.signingKey = "~/.ssh/id_rsa";
      };
    };
  };
}
