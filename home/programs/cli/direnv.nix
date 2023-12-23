{
  programs.bash.enable = true;
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    config = {
      global.warn_timeout = "5m";
      whitelist.prefix = ["~/projects"];
    };
  };
}
