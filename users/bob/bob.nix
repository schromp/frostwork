{ pkgs, ... }: {
  # In here goes whatever normally goes into: users.users.test
  system = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "wireshark"];
    shell = pkgs.zsh;
    initialPassword = "1234";
  };

  home = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
