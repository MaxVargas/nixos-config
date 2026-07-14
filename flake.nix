{
  description = "Flake for NixOS + Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
    # The `follows` keyword in inputs is used for inheritance.
    # Here, `inputs.nixpkgs` of home-manager is kept consistent with
    # the `inputs.nixpkgs` of the current flake,
    # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.doomdir.url = "./doom.d";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }:
  let
    darwinPkgs = import nixpkgs {
      system = "aarch64-darwin";
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      lemuria = let
        username = "hotdog";
        specialArgs = { inherit username; inherit inputs; };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            ./nixos/configuration.nix

            # Can use this to store user-relevant info like ssh key
            ./users/${username}/nixos.nix

            # Make home-manager as a nixos module
            # so that home-manager configurations will be deployed automatically
            home-manager.nixosModules.home-manager
            {
              # true forces home-manager and system to use the same nixpkgs
              home-manager.useGlobalPkgs = false; 
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = {
                imports = [
		            ./users/${username}/home.nix
                inputs.noctalia.homeModules.default
                ];
              };
            }

            # Currently there is a warning; see issue#821 for mangowm
	          inputs.mango.nixosModules.mango
	          {
	            programs.mango.enable = true;
	          }
          ];
        };
    };

    darwinConfigurations = {
      buyan = let
        username = "maxvargas";
        specialArgs = { inherit username; inherit inputs; };
      in
        nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          system = "aarch64-darwin";
          pkgs = darwinPkgs;
          modules = [
            ./users/${username}/darwin.nix

            ({...}: {
              nix.enable = false;
            })

            # Make home-manager as a nixos module
            # so that home-manager configurations will be deployed automatically
            home-manager.darwinModules.home-manager
            {
              # true forces home-manager and system to use the same nixpkgs
              home-manager.useGlobalPkgs = false; 
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;

              home-manager.users.${username} = {
                imports = [
		            ./users/${username}/home.nix
                inputs.nix-doom-emacs-unstraightened.homeModule
                ];
              };
            }
          ];
        };
    };
  };
}
