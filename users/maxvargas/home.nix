{pkgs, ...}@inputs: {
  ###############################################################################
  #
  # All of hotdog's home manager configuration
  #
  ###############################################################################

  imports = [
    #../../home-manager/core.nix

    ../../home-manager/programs/darwin.nix
    ../../home-manager/shell/darwin.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "MaxVargas";
      user.email = "mxvrgs@gmail.com";

      init.defaultBranch = "main";
    };
    signing.format = null;
  };
  #programs.doom-emacs = {
  #  enable = true;
  #};

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "maxvargas";
    stateVersion = "26.05";
    file.".config/nvim".source = ../hotdog/nvim;
  };
  programs.home-manager.enable = true;
}
