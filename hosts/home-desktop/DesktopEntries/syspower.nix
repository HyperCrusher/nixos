{ pkgs, lib, ... }:
let
  logoutScript = pkgs.writeShellScriptBin "logout-wrapper" ''
    #!${pkgs.stdenv.shell}
    exec ${pkgs.systemd}/bin/loginctl terminate-session "$XDG_SESSION_ID"
  '';
in
{
  home.packages = [
    pkgs.systemd
  ];

  xdg.desktopEntries = {
    reboot = {
      name = "Reboot";
      exec = "${pkgs.systemd}/bin/systemctl reboot";
      icon = "system-reboot";
      terminal = false;
      type = "Application";
      categories = [ "System" ];
    };

    shutdown = {
      name = "Shutdown";
      exec = "${pkgs.systemd}/bin/systemctl poweroff";
      icon = "system-shutdown";
      terminal = false;
      type = "Application";
      categories = [ "System" ];
    };

    logout = {
      name = "Logout";
      exec = "${logoutScript}/bin/logout-wrapper";
      icon = "system-log-out";
      terminal = false;
      type = "Application";
      categories = [ "System" ];
    };
  };
}
