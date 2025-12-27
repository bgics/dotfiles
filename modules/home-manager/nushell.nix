{
  programs.nushell = {
    enable = true;
    extraConfig = "
        alias z = zoxide
      ";
    extraEnv = "
        $env.config.show_banner = false
      ";
  };
  home.shell.enableNushellIntegration = true;
}
