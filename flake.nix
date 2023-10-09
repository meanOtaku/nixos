{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, hyprland, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # this is the important part
          modules = [
            ./nixos/configuration.nix
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
            home-manager.nixosModules.home-manager
            {
              # ...
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };
      homeConfigurations = {
        vaibhav = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
