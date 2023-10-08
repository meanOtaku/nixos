{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, hyprland, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # this is the important part
          modules = [
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}
            ./nixos/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        vaibhav = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
