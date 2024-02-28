{
  inputs,
  nixpkgs,
  ...
}: let
  lib = nixpkgs.lib;
  hosts = builtins.readDir ../hosts;
  host = import ../hosts/laptop/laptop.nix;

  _genSystem = {name}: let
    host = import ../hosts/${name}/${name}.nix;
  in
    nixpkgs.lib.nixosSystem {
      system = host.meta.architecture;
      modules = [
        host.configuration
        (
          if host.meta.home-manager
          then inputs.home-manager.nixosModules.home-manager
          else {}
        )
        {networking.hostName = name;}
      ];
      specialArgs = {inherit inputs;};
    };
in {
  generateSystems = lib.mapAttrs (name: _: (_genSystem {inherit name;})) hosts;
}
