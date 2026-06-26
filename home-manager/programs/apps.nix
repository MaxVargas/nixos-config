{
  lib,
  pkgs,
  ...
}@inputs: {
  imports = [
    # inputs.nur.modules.homeManager.default
  ];

  home.packages = with pkgs; [
    vesktop
    protonup-ng
    mangohud # gaming performance monitor
    obs-studio
    caido-cli
    caido-desktop
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
