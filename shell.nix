let
  flakeUrl = "git+file://" + toString ./.;
  flake = builtins.getFlake flakeUrl;
  system = builtins.currentSystem;
  shells = flake.devShells.${system};
in shells.default
