{
  machine,
  pkgs,
  ...
}:
{
  imports = [
    ./common
    ./hosts/${machine}
  ];

  nixpkgs = {
    overlays = [
      (import (
        builtins.fetchTarball {
          url = "https://github.com/nix-community/emacs-overlay/archive/7e630e5c5e5b860f89d05a64129e51f342766b70.tar.gz";
          sha256 = "1hlzc1ylc8a68xdy1750il0rvjdv5x40j0c2rq6gnxnpp03xkw31";
        }
      ))
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "reboot=acpi"
    ];
    loader = {
      grub = {
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        enable = true;
        timeoutStyle = "menu";
      };
    };
  };
}
