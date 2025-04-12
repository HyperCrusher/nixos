{ ...
}:
{
  nix.settings = {
    auto-optimise-store = true;
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  time.timeZone = "America/Phoenix";

  environment = {
    localBinInPath = true;
    variables = {
      EDITOR = "nvim";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XCURSOR_SIZE = "24";
    };
  };

  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [
      "ntfs"
      "btrfs"
    ];
    loader = {
      grub = {
	efiSupport = true;
	timeoutStyle = "menu";
      };
      timeout = 30;
    };
  };

  console = {
    earlySetup = true;
    keyMap = "us";
    font = "Lat2-Terminus16";
    colors = [
      "16161e"
      "db4b4b"
      "9ece6a"
      "ff9e64"
      "7aa2f7"
      "bb9af7"
      "2ac3de"
      "c0caf5"
      "a9b1d6"
      "db4b4b"
      "9ece6a"
      "ff9e64"
      "7aa2f7"
      "bb9af7"
      "2ac3de"
      "c0caf5"
    ];
  };

}
