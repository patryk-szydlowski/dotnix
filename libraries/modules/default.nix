{ inputs }:
let
  config = import ./config.nix { inherit inputs path; };
  option = import ./option.nix { inherit inputs path; };
  path = import ./path.nix { inherit inputs; };
in { inherit config option; }
