{pkgs, ...}: {
  programs = {
    less.enable = true;
    lesspipe.enable = true;
  };

  home = {
    sessionVariables.LESS = "-fFR";
    file.".lessfilter" = {
      executable = true;
      source = pkgs.substituteAll {
        src = ./lessfilter.sh;
        ezaPath = "${pkgs.eza}/bin/eza";
        batPath = "${pkgs.bat}/bin/bat";
      };
    };
  };
}
