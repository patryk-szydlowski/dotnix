{
  config,
  pkgs,
  ...
}: {
  programs.fzf = {
    enable = true;
    colors = {
      bg = "#${config.colorScheme.colors.base00}";
      fg = "#${config.colorScheme.colors.base05}";
      hl = "#${config.colorScheme.colors.base08}";
      "bg+" = "#${config.colorScheme.colors.base02}";
      "fg+" = "#${config.colorScheme.colors.base05}";
      "hl+" = "#${config.colorScheme.colors.base08}";
      spinner = "#${config.colorScheme.colors.base06}";
      header = "#${config.colorScheme.colors.base08}";
      info = "#${config.colorScheme.colors.base0E}";
      pointer = "#${config.colorScheme.colors.base06}";
      marker = "#${config.colorScheme.colors.base06}";
      prompt = "#${config.colorScheme.colors.base0E}";
    };

    defaultCommand = "${pkgs.fd}/bin/fd --type file --ignore-case --hidden";
    defaultOptions = ["--preview '${pkgs.pistol}/bin/pistol {}'"];
  };
}
