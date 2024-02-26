{...}: {
  architecture = "x86_64-linux";

  configuration = {
    pkgs,
    config,
    ...
  }: {
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

    system.stateVersion = "23.11";
  };

  hardwareConfiguration = import ./hardware-configuration.nix;
}
