{ pkgs, ... }: {
  # nix-darwin system-level config
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
  };
  system = {
    stateVersion = 7;
    primaryUser = "maxvargas";
  };

  environment.systemPackages = [ pkgs.home-manager ];

  users.users.maxvargas = {
    name = "maxvargas";
    home = "/Users/maxvargas";
  };

  #homebrew = {
  #  enable = true;
  #  onActivation = {
  #    autoUpdate = true;
  #    cleanup = "none";
  #  };

  #  taps = [];
  #  brews = [];
  #  casks = [ "docker-desktop" ];

  #};
}

