{ nixpkgs, ...}: {
  generateSystems = {name, system}: {
    nixosConfigurations = {
      "${name}" = nixpkgs.lib.nixosSystem {
        system = "${system}";
      };
    };
  };
}
