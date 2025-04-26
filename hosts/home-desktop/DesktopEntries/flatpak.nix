{ pkgs, ... }:
{
  xdg.desktopEntries = {
    flatseal = {
      name = "Flatseal";
      exec = "${pkgs.flatpak}/bin/flatpak run com.github.tchx84.Flatseal";
      terminal = false;
      type = "Application";
    };

    wps = {
      name = "Office";
      exec = "${pkgs.flatpak}/bin/flatpak run com.wps.Office";
      terminal = false;
      type = "Application";
    };
  };
}
