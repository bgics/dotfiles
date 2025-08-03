{
  programs.nushell = {
    enable = true;
    envFile.source = ../env.nu;
  };
  home.shell.enableNushellIntegration = true;
}
