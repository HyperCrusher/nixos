{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./graphicsCard.nix
    ./network.nix
    ./packages.nix
    ./settings.nix
    ./users.nix
  ];
}
