{ pkgs, ... }:
{
  home = {
    username = "Hyper";
    homeDirectory = "/home/hyper";
    stateVersion = "23.11";
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];
    extraConfig = ''
    monitor=DP-2,2560x1440@144,auto-right,1
    monitor=DP-3,2560x1440@144,auto-left,1

    source = ~/.config/hypr/hyprland-nix.conf
    '';
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userEmail = "hypercrusher@proton.me";
      userName = "Hyper";
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}
