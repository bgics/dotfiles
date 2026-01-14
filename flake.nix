{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nvf.url = "github:notashelf/nvf";
  };

  outputs =
  { home-manager
  , flake-utils
  , nix-darwin
  , nixpkgs
  , nixos-hardware
  , nvf
  , ...
  }@inputs:

  flake-utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            taplo
            lua-language-server
          ];
        };
      }
    )
  // {
    darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/mac/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.bhuvansh = ./hosts/mac/home.nix;
          home-manager.extraSpecialArgs = { inherit nvf; };
        }
      ];
    };

    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs nvf; };
        modules = [
          ./hosts/nixos/laptop/configuration.nix
          nixos-hardware.nixosModules.asus-zephyrus-ga503
        ];
      };

      vm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs nvf; };
        modules = [
          ./hosts/nixos/vm/configuration.nix
        ];
      };
    };

    homeConfigurations.wsl =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/wsl/home.nix ];
      };
  };

}
