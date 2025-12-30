let
  envFile = builtins.readFile ../../env.nu;
in
{
  programs.nushell = {
    enable = true;
    extraEnv = envFile;
  };
  home.shell.enableNushellIntegration = true;
}
