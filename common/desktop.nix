{
  pkgs,
  inputs,
  system,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    kitty
    ghostty

    wl-clipboard

    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    hyprshot
    hyprpaper
  ];

  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };
  services.xserver.enable = false;

  programs.hyprland = {
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    enable = true;
    xwayland.enable = true;
  };
  services.displayManager.ly.enable = true;
}
