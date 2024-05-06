{
  inputs,
  nixpkgs,
  ...
}: let
  lib = nixpkgs.lib;
  hosts = builtins.readDir ../homeManagerSystems;

  _genHMSystem = let
    host = import ../homeManagerSystems/${name}/${name}.nix;
    system = host.meta.architecture;
    pkgs = nixpkgs.legacyPackages.${system};
    user = import ../users/${host.meta.user}/${host.meta.user};
  in
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        user.home
      ];

      extraSpecialArgs = {
        inherit inputs;
      };
    };
in
  lib.mapAttrs (name: _: (_genHMSystem {inherit name;})) hosts
