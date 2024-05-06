{
  meta = {
    architecture = "x86_64-linux";
    home-manager = true;
    users = [
      "bob"
    ];
  };

  configuration = {
    imports = [
      ./configuration.nix
      ./hardware-configuration.nix
    ];
  };
}
