{pkgs, ...}: {
  home = {
    packages = [pkgs.eza];
    shellAliases = {
      ls = "eza --icons --group-directories-first --git-ignore";
      la = "ls --all";
      lt = "ls --tree";
    };
  };
}
