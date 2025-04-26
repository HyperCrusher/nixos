{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./flatpaks.nix
    ./graphicsCard.nix
    ./network.nix
    ./packages.nix
    ./settings.nix
    ./users.nix
  ];
}
