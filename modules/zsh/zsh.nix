{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    modules.programs.zsh.enable = mkEnableOption "Enabel zsh";
  };

  system = {
    programs.zsh = {
      enable = true;
    };
  };

  home = {
    programs.zsh = {
      enable = true;
      oh-my-zsh.enable = true;
    };
  };
}
