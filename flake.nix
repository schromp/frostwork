{
  description = "Nixos framework";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    frostwork = import ./frostwork;
  in {

    frostwork.generateSystems {
      name = "test";
    };

    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
      };
    };

  };
}
