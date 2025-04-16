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
    overlays = [
      (import
        (builtins.fetchTarball
          {url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
          sha256="0wkwkyji171h3xpv8jaj46bzjlwn5kk21c01fib44zayx9z18yb9";}))
    ];
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
