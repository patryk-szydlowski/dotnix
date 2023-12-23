{
  imports = [
    ../../programs/home-manager.nix
    ../../programs/git.nix
    ../../programs/direnv.nix
  ];

  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };
}
