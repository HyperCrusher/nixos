{
  pkgs,
  inputs,
  system,
  ...
}:
{
  environment = {
    variables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK_THEME = "Tokyonight-Dark-BL";
      XCURSOR_THEME = "Qogir Cursors";
    };

    pathsToLink = [
      "/share/themes"
      "/share/icons"
    ];

    systemPackages = with pkgs; [
      inputs.gtk-themes.packages.${system}.default
      gtk-engine-murrine
      papirus-icon-theme
      libsForQt5.qt5ct
      kdePackages.qt6ct
      kdePackages.breeze-icons
      gnome-themes-extra
      qogir-theme
      qogir-icon-theme
    ];

    etc = {
      "gtk-2.0/gtkrc".text = ''
        gtk-cursor-theme-name="Qogir Cursors"
      '';
      "xdg/gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-theme-name=Tokyonight-Dark-BL
        gtk-icon-theme-name=Tokyonight
        gtk-font-name=Source Sans Pro 12
        gtk-cursor-theme-name=Qogir Cursors
        gtk-cursor-theme-size=0
        gtk-toolbar-style=GTK_TOOLBAR_BOTH
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images=1
        gtk-menu-images=1
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle=hintfull
        gtk-xft-rgba=rgb
        gtk-application-prefer-dark-theme=1
        gtk-enable-animations=true
        gtk-primary-button-warps-slider=false
      '';
    };
  };
}
