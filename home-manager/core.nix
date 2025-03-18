{username, ...}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage

  # home-manager does not use the same nixpkgs as the system
  # this *can* be made possible but apparently is easier to break
  # https://discourse.nixos.org/t/i-can-t-install-unfree-package/48943/5
  nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
