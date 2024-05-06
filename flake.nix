{
  description = "Nixos framework";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    frostwork = import ./frostwork {inherit nixpkgs inputs;};
  in {
    # For testing purposes this is exposed here
    nixosConfigurations = frostwork.generateNixosSystems {inherit inputs nixpkgs;};

    homeConfigurations = frostwork.generateHMSystems {inherit inputs nixpkgs;};

    lib = import ./frostwork;
  };
}
