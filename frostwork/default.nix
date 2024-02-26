{
  inputs,
  nixpkgs,
  ...
}: let
  lib = nixpkgs.lib;
  hosts = builtins.readDir ../hosts;
  _genSystem = {
    name,
  }: let
    host = import ../hosts/${name}/${name}.nix;
    system = host.architecture;
    configuration = host.configuration;
    hardwareConfiguration = host.hardwareConfiguration;
  in {
    "${name}" = nixpkgs.lib.nixosSystem {
      system = "${system}";
      modules = [
        # home-manager.nixosModules.home-manager
        # configuration
        # hardwareConfiguration
        {networking.hostName = name;}
      ];
      specialArgs = {inherit inputs;};
    };
  };
in {
  generateSystems = lib.mapAttrs (name: _: _genSystem {inherit name;}) hosts;
}
