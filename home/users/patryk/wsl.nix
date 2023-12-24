{
  imports = [
    ../../programs/cli/zsh
    ../../programs/cli/starship.nix
    ../../programs/cli/fzf.nix
    ../../programs/cli/eza.nix
    ../../programs/cli/bat.nix
    ../../programs/cli/zoxide.nix

    ../../programs/dev/git.nix
    ../../programs/dev/direnv.nix
    ../../programs/dev/devenv.nix

    ../../programs/misc/home-manager.nix
  ];

  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };
}
