{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
    # The `follows` keyword in inputs is used for inheritance.
    # Here, `inputs.nixpkgs` of home-manager is kept consistent with
    # the `inputs.nixpkgs` of the current flake,
    # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # ref = ""; # v0.42.0
      # submodules = true;
    };
    # nix-ld = {
    #   url = "github:Mic92/nix-ld";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations = {
      lemuria = let
        username = "max";
        specialArgs = {inherit username; inherit inputs;};
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
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }

	    # Nix-ld for handling prepackaged binaries
	    # nix-ld.nixosModules.nix-ld
	    # { programs.nix-ld.dev.enable = true; }
          ];
        };
    };
  };
}
