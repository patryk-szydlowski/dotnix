{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-vscode-server.nixosModules.default];

  programs.nix-ld.enable = true;

  services.vscode-server.enable = true;

  environment.systemPackages = [pkgs.wget];

  wsl.extraBin = [
    {src = "${pkgs.coreutils}/bin/uname";}
    {src = "${pkgs.coreutils}/bin/dirname";}
    {src = "${pkgs.coreutils}/bin/readlink";}
  ];
}
