{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    plugins = [
      {
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    initExtra = let
      previewScripts = {
        command = pkgs.writeShellApplication {
          name = "preview-command";
          text = lib.fileContents ./preview-command.sh;
          runtimeInputs = [pkgs.tldr pkgs.bat-extras.batman pkgs.which];
        };
      };
      previewers = {
        content = "${pkgs.pistol}/bin/pistol";
        command = "${previewScripts.command}/bin/preview-command";
      };
    in ''
      zstyle ':fzf-tab:complete:*:*' fzf-flags --height=80%
      zstyle ':fzf-tab:complete:*:*' fzf-preview '${previewers.content} ''${(Q)realpath}'
      zstyle ':fzf-tab:complete:-command-:*' fzf-preview '${previewers.command} $word'
    '';
  };
}
