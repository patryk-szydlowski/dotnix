{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = false;
    syntaxHighlighting.enable = true;
  };

  imports = [
    ./plugins/zsh-autocomplete.nix
  ];
}
