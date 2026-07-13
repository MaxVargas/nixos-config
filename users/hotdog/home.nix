{pkgs, ...}@inputs: {
  ###############################################################################
  #
  # All of hotdog's home manager configuration
  #
  ###############################################################################

  imports = [
    #../../home-manager/core.nix

    ../../home-manager/programs
    ../../home-manager/shell
    inputs.mango.hmModules.mango
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

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    file.".config/nvim".source=./nvim;
    homeDirectory="/home/hotdog";
    stateVersion = "26.05";
  };
  programs.home-manager.enable = true;
}
