{
  inputs,
  nixpkgs,
  ...
}: let
  lib = nixpkgs.lib;
  hosts = builtins.readDir ../nixosSystems;
  _genSystem = {name}: let
    host = import ../nixosSystems/${name}/${name}.nix;
    users = host.meta.users;
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
in
  lib.mapAttrs (name: _: (_genSystem {inherit name;})) hosts
