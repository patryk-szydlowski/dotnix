{
  home = {
    username = "patryk";
    homeDirectory = "/home/patryk";
  };

  imports = [
    ../../programs/cli/zsh
    ../../programs/cli/color-scheme.nix
    ../../programs/cli/starship.nix
    ../../programs/cli/pistol.nix
    ../../programs/cli/bat.nix
    ../../programs/cli/fzf.nix

    ../../programs/dev/git.nix
    ../../programs/dev/direnv.nix
    ../../programs/dev/devenv.nix

    ../../programs/misc/home-manager.nix
    ../../programs/misc/color-scheme.nix
  ];
}
