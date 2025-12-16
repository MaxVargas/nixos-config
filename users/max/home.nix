{pkgs, ...}@inputs: {
  ###############################################################################
  #
  # All of max's home manager configuration
  #
  ###############################################################################

  imports = [
    ../../home-manager/core.nix

    ../../home-manager/programs
    ../../home-manager/shell
    inputs.mango.hmModules.mango
  ];

  programs.git = {
    userName = "MaxVargas";
    userEmail = "mxvrgs@gmail.com";
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
