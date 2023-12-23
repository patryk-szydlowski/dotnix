{
  wsl.defaultUser = "patryk";

  users.users = {
    patryk = {
      isNormalUser = true;
      home = "/home/patryk";
      initialPassword = "password";
      extraGroups = ["wheel"];
    };
  };

  home-manager.users = {
    patryk = import ../../../home/users/patryk/wsl.nix;
  };
}
