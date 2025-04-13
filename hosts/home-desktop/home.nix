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
