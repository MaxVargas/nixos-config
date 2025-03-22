{config, pkgs, ... }: 
{
  home.packages = with pkgs; [
    wofi
    dolphin
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    # Forces freezing on my system??
    # systemd.enable = true;

    extraConfig = ''
      ${builtins.readFile ./config/hyprland.conf}
    '';
  };
  # ...
}
