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
    nixosConfigurations = frostwork.generateSystems;
  };
}
