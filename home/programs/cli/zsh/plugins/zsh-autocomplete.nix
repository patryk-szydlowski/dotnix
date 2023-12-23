{pkgs, ...}: {
  programs.zsh.initExtra = ''
    source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  '';
}
