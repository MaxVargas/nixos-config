{config, pkgs, ... }: 
{
  home.packages = with pkgs; [
    wofi
    kdePackages.dolphin
    hyprpaper
  ];

  wayland.windowManager.mango = {
    enable = true;
    extraConfig = builtins.readFile ./config/mango.conf;
    autostart_sh = ''
      # see autostart.sh
      # Note: here no need to add shebang

      #dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      # The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
      /usr/lib/xdg-desktop-portal-wlr &

      # Clipboard manager
      wl-clip-persist --clipboard regular --reconnect-tries 0 &
      # Watch clipboard and store history
      wl-paste --type text --watch cliphist store &

      firefox &
      emacs --daemon --init-directory ~/.config/emacs/ &
      #quickshell &
      noctalia &
    '';
  };
}
