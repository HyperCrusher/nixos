{ ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  powerManagement.cpuFreqGovernor = "performance";
  hardware.xone.enable = true;
}
