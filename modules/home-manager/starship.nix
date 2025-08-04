{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
  home.file.".config/starship.toml".source = ../../starship.toml;
}
