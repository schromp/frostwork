{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Frostwork sets the hostname equal to the folder name of the host
  # To override the hostname uncomment the line below and set the hostname
  # networking.hostName = pkgs.lib.mkForce "hostname";

  # Setup the user
  users.users.root.initialPassword = "1234";
  users.defaultUserShell = pkgs.zsh;
  users.users.test = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "wireshark"];
    shell = pkgs.zsh;
    initialPassword = "1234";
  };
  environment.shells = with pkgs; [zsh];

  programs.zsh.enable = true;

  # Set timezone
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  time.hardwareClockInLocalTime = true;

  boot.supportedFilesystems = ["ntfs"];

  # Bootloader stuff
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/nvme0n1";
      useOSProber = true;
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users.test.home.stateVersion = "23.11";
  };

  system.stateVersion = "23.11";
}
