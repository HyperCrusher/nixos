{ pkgs
, ...
}:
let
  systemTools = with pkgs; [
    bottom
    btrfs-progs
    nfs-utils
    ntfs3g
    p7zip
    power-profiles-daemon
    smartmontools
    stow
    upower
    waypipe
    woeusb
    #for emacs
    cmake
    libtool
    libvterm
    gnumake
    gcc
  ];

  fileTools = with pkgs; [
    bat
    eza
    fd
    fzf
    gh
    jq
    lemmeknow
    man
    man-pages
    monolith
    nushell
    oh-my-posh
    pfetch
    ripgrep
    rsync
    tldr
    tree
    unrar
    unzip
    zoxide
  ];

  applications = with pkgs; [
    krita
    mpv
    pavucontrol
    rofi
    vivaldi
    vivaldi-ffmpeg-codecs
    wget
    curl
  ];

in
{
  programs = {
    git = {
      enable = true;
      config = {
        init.defaultBranch = "master";
        user = {
          name = "Hyper";
          email = "hypercrusher@proton.me";
        };
      };
    };
    java = {
      enable = true;
      binfmt = true;
    };
    nm-applet = {
      enable = true;
    };
    udevil.enable = true;
  };

  services = {
    emacs = {
      enable = true;
      defaultEditor = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  environment.variables = {
    PF_INFO = "ascii title kernel wm editor pkgs memory uptime";
  };

  environment.systemPackages =
    systemTools ++
    fileTools ++
    applications;
}
