{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
      save = 100000;
      size = 100000;
      share = false;
    };
  };

  imports = [
    ./plugins/fzf-tab.nix
  ];
}
