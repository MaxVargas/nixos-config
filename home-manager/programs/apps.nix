{
  lib,
  pkgs,
  ...
}@inputs: {
  imports = [
    # inputs.nur.modules.homeManager.default
  ];

  home.packages = with pkgs; [
    discord
    protonup
    # wine
    mangohud # gaming performance monitor
    # nur.repos.ataraxiasjel.waydroid-script # Install android for AMD
    obs-studio
    burpsuite
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
