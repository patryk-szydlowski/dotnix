{pkgs, ...}: {
  programs = {
    less.enable = true;
    lesspipe.enable = true;
  };

  home = {
    sessionVariables.LESS = "-FR";
    file.".lessfilter" = {
      executable = true;
      source = pkgs.substituteAll {
        src = ./lessfilter.sh;
        ezaDir = "${pkgs.eza}/bin/eza";
        batDir = "${pkgs.bat}/bin/bat";
      };
    };
  };
}
