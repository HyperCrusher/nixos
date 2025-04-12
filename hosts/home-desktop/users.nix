{ pkgs, ... }:
{
  users = {
    users = {
      Hyper = {
        isNormalUser = true;
        shell = pkgs.zsh;
        home = "/home/hyper";
        description = "Hyper";
        initialPassword = "changeme";
        extraGroups = [
          "flatpak"
          "disk"
          "qemu"
          "kvm"
          "docker"
          "wireshark"
          "libvirtd"
          "networkmanager"
          "wheel"
          "audio"
          "video"
        ];
      };
    };
  };
}
