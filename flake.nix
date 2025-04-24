{
  description = "Hyper's Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wpsFonts.url = "github:hypercrusher/wpsfonts";
    gtk-themes.url = "github:hypercrusher/gtk-themes";
    #hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations.home-desktop = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs system;
          machine = "home-desktop";
        };
        modules = [
          home-manager.nixosModules.home-manager
          ./config.nix
        ];
      };
    };
}
