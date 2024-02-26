{
  description = "Nixos framework";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  } @inputs: let
    frostwork = import ./frostwork { inherit nixpkgs inputs; };
  in {
    # nixosConfigurations = (frostwork.generateSystems {
    #   name = "laptop";
    #   system = "x86_64-linux";
    # });

    nixosConfigurations = frostwork.generateSystems;
  };
}
