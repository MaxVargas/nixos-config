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

    # settings = {
    #   "$mod" = "SUPER";
    #   bind = [
    #     "$mod, F, exec, firefox"
    #     "$mod, Q, exec, kitty"
    #     "$mod, C, killactive,"
    #     "$mod, M, exit,"
    #   ]
    #   ++ (
    #      # workspaces
    #      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
    #      builtins.concatLists (builtins.genList (i:
    #        let ws = i + 1;
    #        in [
    #          "$mod, code:1${toString i}, workspace, ${toString ws}"
    #          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    #        ]
    #      )
    #      9)
    #   );
    # };

    extraConfig = ''
      ${builtins.readFile ./config/hyprland.conf}
    '';
  };
  # ...
}
