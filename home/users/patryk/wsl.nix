{
  imports = [
    ../../programs/cli/home-manager.nix
    ../../programs/cli/zsh
    ../../programs/cli/git.nix
    ../../programs/cli/direnv.nix
    ../../programs/cli/devenv.nix
    ../../programs/cli/starship.nix
    ../../programs/cli/eza.nix
    ../../programs/cli/zoxide.nix
  ];

  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };
}
