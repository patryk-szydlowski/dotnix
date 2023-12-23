{
  imports = [
    ../../programs/cli/home-manager.nix
    ../../programs/cli/zsh
    ../../programs/cli/git.nix
    ../../programs/cli/direnv.nix
    ../../programs/cli/devenv.nix
  ];

  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };
}
