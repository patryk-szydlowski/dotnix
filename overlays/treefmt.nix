{ inputs, pkgs }:
let inherit (inputs.nixpkgs) lib;
in pkgs.rustPlatform.buildRustPackage rec {
  pname = "treefmt";
  version = "0.6.1";

  src = pkgs.fetchFromGitHub {
    owner = "numtide";
    repo = "treefmt";
    rev = "67d3c553be81a09fbf691b72f292e97b6ae71cc4";
    sha256 = "1169k8j8gd500mzsrlg0b942h2y7zm5s8r4sf3a0mx664ab0r0m1";
  };

  cargoSha256 = "sha256-bpNIGuh74nwEmHPeXtPmsML9vJOb00xkdjK0Nd7esAc=";

  meta = {
    description = "one CLI to format the code tree";
    homepage = "https://github.com/numtide/treefmt";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.zimbatm ];
  };
}
