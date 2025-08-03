{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { home-manager
    , flake-utils
    , nix-darwin
    , nixpkgs
    , ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [
                nil
                nixpkgs-fmt
                taplo
                lua-language-server
              ];
            };
          };
        }
      )
    // {
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/mac/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bhuvansh = ./hosts/mac/home.nix;
          }
        ];
      };
    }
    // (
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/nixos/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };
        homeConfigurations."wsl" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./hosts/wsl/home.nix ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      }
    );
}
