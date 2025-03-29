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
