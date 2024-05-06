{...}: let
in {
  generateNixosSystems = import ./generateNixosSystems.nix;
  generateHMSystems = import ./generateHMSystems.nix;
}
