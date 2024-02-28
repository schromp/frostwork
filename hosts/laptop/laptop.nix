{
  meta = {
    architecture = "x86_64-linux";
    home-manager = true;
  };

  configuration = {
    imports = [
      ./configuration.nix
      ./hardware-configuration.nix
    ];
  };
}
