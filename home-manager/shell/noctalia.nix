{
  lib,
  pkgs,
  ...
}: {
  programs = {
    noctalia = {
      enable = true;

      settings = {
        audio = {
          enable_overdrive = false;
          enable_sounds = false;
          notification_sound = "";
          sound_volume = 0.5;
          volume_change_sound = "";
        };

        backdrop = {
        	enabled = false;
        };

        bar = {
          order = [ "default" ];

          default = {
            auto_hide = false;
            background_opacity = 1.0;
            border = "outline";
            border_width = 0.2;
            capsule = false;
            center = [ "workspaces" ];
            color = "secondary";
            contact_shadow = false;
            enabled = true;
            end = [ "notifications" "clipboard" "brightness" "group:g1" "clock" "session" ];
            icon_color = "tertiary";
            margin_edge = 0;
            margin_ends = 0;
            radius = 0;
            reserve_space = true;
            position  = "top";
            shadow = false;
            start = [ "control-center" "wallpaper" "volume" "taskbar" "media" ];
            thickness = 33;
	    capsule_group = {
              border = "";
              fill = "surface_variant";
              id = "g1";
              members = [ "ram" "cpu" "temp" "network" ];
              opacity = 1.0;
              padding = 6.0;
	    };
          };
        };

        desktop_widgets = {
          enabled = false;
        };
        dock = {
          enabled = false;
        };

        theme = {
          builtin = "Kanagawa";
	  source = "builtin";
	  community_palette = "Creamy Forest";
	  mode = "dark";
	};

	shell = {
	  corner_radius_scale = 0.4;
	  setting_show_advanced = true;
          screen_corners.size = 15;
	};
      };
    };
  };
}

