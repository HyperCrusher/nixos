{ ... }:
{
  imports = [
    ./desktop.nix
    ./fonts.nix
    ./packages.nix
    ./settings.nix
    ./theme.nix
  ];
  system.stateVersion = "23.11";
}
