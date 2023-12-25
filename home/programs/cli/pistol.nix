{pkgs, ...}: {
  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "text/*";
        command = "${pkgs.bat}/bin/bat --paging=never --color=always %pistol-filename%";
      }
      {
        mime = "inode/directory";
        command = "${pkgs.eza}/bin/eza -hl --git --color=always --icons %pistol-filename%";
      }
    ];
  };
}
