{ pkgs, inputs, lib, ... }:

let
  makeFirejailWrapper =
    pkg: originalBin: newName: extraArgs:
    pkgs.writeShellScriptBin newName ''
      exec ${pkgs.firejail}/bin/firejail --net=none ${lib.escapeShellArgs extraArgs} ${pkg}/bin/${originalBin} "$@"
    '';

  firejailedEt = makeFirejailWrapper pkgs.wpsoffice "et" "spreadsheets" [ ];
  firejailedWps = makeFirejailWrapper pkgs.wpsoffice "wps" "writer" [ ];
  firejailedWpp = makeFirejailWrapper pkgs.wpsoffice "wpp" "powerpoint" [ ];
  firejailedWpspdf = makeFirejailWrapper pkgs.wpsoffice "wpspdf" "pdf" [ ];

in
{
  home = {
    username = "Hyper";
    homeDirectory = "/home/hyper";
    stateVersion = "23.11";
  };

  home.packages = [
    firejailedEt
    firejailedWps
    firejailedWpp
    firejailedWpspdf
  ];

  home.file.".local/bin/spreadsheets" = {
    source = "${firejailedEt}/bin/spreadsheets";
    executable = true;
  };
  home.file.".local/bin/word" = {
    source = "${firejailedWps}/bin/writer";
    executable = true;
  };
  home.file.".local/bin/presentation" = { source = "${firejailedWpp}/bin/powerpoint";
    executable = true;
  };
  home.file.".local/bin/pdf" = {
    source = "${firejailedWpspdf}/bin/pdf";
    executable = true;
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
