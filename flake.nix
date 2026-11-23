{
  description = "Axenide's ~";

  inputs = {
    self.submodules = true;

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fornax = {
      url = "path:./Fornax";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    fornax,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."adriano" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [./home.nix];

      extraSpecialArgs = {
        inherit fornax;
      };
    };
  };
}
