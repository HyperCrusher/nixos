{ pkgs, ... }:
let
Emacs = with pkgs; ((emacsPackagesFor emacs-gtk).emacsWithPackages (epkgs: [
  epkgs.vterm
  epkgs.org
  epkgs.org-modern
  epkgs.ob-kotlin
  epkgs.org-table-sticky-header
]));

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
    zsh
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
    rofi-wayland
    firefox
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
    zsh.enable = true;
  };

  services = {
    emacs = {
      package = Emacs;
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
    applications ++
    [ Emacs ];
}

