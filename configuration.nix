{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
    pkgs.helix
  ];

  environment.shells = [
    pkgs.nushell
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = inputs.self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  security.pam.services.sudo_local.touchIdAuth = true;
  homebrew.enable = true;

  system.primaryUser = "bhuvansh";

  homebrew.casks = [ "ghostty" ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.knownUsers = [ "bhuvansh" ];

  users.users."bhuvansh" = {
    name = "bhuvansh";
    home = "/Users/bhuvansh";
    shell = pkgs.nushell;
    uid = 502;
  };
}
