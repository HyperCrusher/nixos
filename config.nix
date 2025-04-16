{ machine
, pkgs
, ...
}:
{
  imports = [
    ./common
    ./hosts/${machine}
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
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
