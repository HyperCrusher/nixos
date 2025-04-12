{ pkgs, inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.Hyper = import ./home.nix;
    extraSpecialArgs = { inherit inputs; };
  };

  programs = {
    npm = {
      enable = true;
      npmrc = ''''${HOME}/.config/npm-packages'';
    };

    virt-manager.enable = true;

    firejail = {
      enable = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  services = {
    jellyfin = {
      enable = true;
      user = "Hyper";
    };
  };

  environment.systemPackages = with pkgs; [
    android-file-transfer
    android-tools
    ani-cli
    bitcoin
    discord
    ghostty
    signal-desktop
    slack
    teams-for-linux
    telegram-desktop
    tor-browser-bundle-bin
    qbittorrent
    wpsoffice
  ];
}
