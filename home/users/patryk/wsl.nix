{
  imports = [
    ../../programs/cli/home-manager.nix
    ../../programs/cli/git.nix
    ../../programs/cli/direnv.nix
  ];

  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };
}
