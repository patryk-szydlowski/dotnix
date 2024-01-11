{ osConfig, ... }: {
  home.stateVersion = "24.05";

  home.username = "patryk";
  home.homeDirectory = osConfig.users.users.patryk.home;

  modules = {
    home-manager.cli.fish.enable = true;
    home-manager.cli.git.enable = true;
    home-manager.cli.home-manager.enable = true;
    home-manager.cli.nix-index.enable = true;
    home-manager.users.patryk.enable = true;
  };
}
