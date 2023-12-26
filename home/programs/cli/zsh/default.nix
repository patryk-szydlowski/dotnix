{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
      save = 100000;
      size = 100000;
    };
  };

  imports = [
    ./plugins/zsh-autosuggestions.nix
    ./plugins/fzf-tab
  ];
}
