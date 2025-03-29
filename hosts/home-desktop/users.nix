{ pkgs, ... }:
{
  users = {
    users = {
      Hyper = {
        isNormalUser = true;
        shell = pkgs.nushell;
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
