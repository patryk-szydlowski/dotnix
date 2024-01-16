{ osConfig, ... }: {
  home.stateVersion = "24.05";

  home.username = "patryk";
  home.homeDirectory = osConfig.users.users.patryk.home;

  modules = {
    home-manager.cli.direnv.enable = true;
    home-manager.cli.fish.enable = true;
    home-manager.cli.git.enable = true;
    home-manager.cli.github.enable = true;
    home-manager.cli.home-manager.enable = true;
    home-manager.cli.nix-index.enable = true;
    home-manager.security.ssh.enable = true;
    home-manager.users.patryk.enable = true;

    nix.overlays.enable = true;

    nix-index-database.core.enable = true;

    sops-nix.core.enable = true;
    sops-nix.users.patryk.enable = true;
  };
}
