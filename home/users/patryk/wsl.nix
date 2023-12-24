{
  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };

  imports = [
    ../../programs/cli/zsh.nix
    ../../programs/cli/starship.nix

    ../../programs/dev/git.nix
    ../../programs/dev/direnv.nix
    ../../programs/dev/devenv.nix

    ../../programs/misc/home-manager.nix
  ];
}
