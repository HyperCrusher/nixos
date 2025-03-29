{ pkgs, ... }:
{
  networking = {
    hostName = "Hyper";
    wireless.enable = false;
    networkmanager.enable = true;
    enableIPv6 = true;
    firewall.enable = false;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    mtr
    whois
    nfs-utils
    protonvpn-cli
    gnupg
    python3Packages.pyxdg
  ];
}
