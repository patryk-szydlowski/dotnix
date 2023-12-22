{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.patryk = import ../../../home/users/patryk;
  };
}
