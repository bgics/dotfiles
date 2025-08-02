{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  home.file.".config/starship.toml".source = ../starship.toml;
}
