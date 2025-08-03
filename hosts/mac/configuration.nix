{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
    pkgs.helix
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

  # security.pam.services.sudo_local.touchIdAuth = true;

  system.primaryUser = "bhuvansh";

  homebrew.enable = true;
  homebrew.casks = [ "ghostty" ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.knownUsers = [ "bhuvansh" ];

  users.users.bhuvansh.home = "/Users/bhuvansh";
  users.users.bhuvansh.shell = pkgs.zsh;
  users.users.bhuvansh.uid = 502;
}
