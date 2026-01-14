{ config, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  home.shell.enableZshIntegration = true;
  programs.zsh.dotDir = "${config.xdg.configHome}/zsh";
}
