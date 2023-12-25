{
  pkgs,
  lib,
  ...
}: let
  makeCommand = args: lib.strings.concatStringsSep " " args;
in {
  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "text/*";
        command = makeCommand [
          "${pkgs.bat}/bin/bat"
          "--paging=never"
          "--style=plain"
          "--color=always"
          "%pistol-filename%"
        ];
      }
      {
        mime = "inode/directory";
        command = makeCommand [
          "${pkgs.eza}/bin/eza"
          "--git"
          "--tree"
          "--icons"
          "--level=1"
          "--color=always"
          "%pistol-filename%"
        ];
      }
    ];
  };
}
