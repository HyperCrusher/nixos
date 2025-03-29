{ pkgs
, inputs
, system
, ...
}:
{
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.packages = with pkgs; [
    source-han-sans
    source-han-sans-vf-otf
    source-sans-pro
    office-code-pro
    cantarell-fonts
    nerd-fonts.fira-code
    nerd-fonts.inconsolata
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.liberation
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.sauce-code-pro
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    baekmuk-ttf
    ttf_bitstream_vera
    comic-mono
    dejavu_fonts
    joypixels
    liberation_ttf
    corefonts
    vistafonts
    texlivePackages.opensans

    inputs.wpsFonts.packages.${system}.default
  ];
}
