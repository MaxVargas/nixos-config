{config, pkgs, ... }: 
{
  home.packages = with pkgs; [
    wofi
    kdePackages.dolphin
    hyprpaper
  ];

  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      # see config.conf
      #<Dollar>builtins.readFile ./config/mango.conf}

      # Terminal and menu
      bind=SUPER,Return,spawn,foot
      bind=SUPER,space,spawn,rofi -show drun -show-icons

      # Quick reload config
      bind=SUPER+SHIFT,r,reload_config

      # Apps
      bind=SUPER,f,spawn,firefox
      bind=SUPER,b,spawn,obsidian
      bind=SUPER,d,toggle_named_scratchpad,discord,none,discord
      bind=SUPER,g,spawn,steam
      bind=SUPER,e,toggle_named_scratchpad,foot-yazi,none,foot -e yazi

      ##
      ## KEYBINDS
      ##

      # screenshot
      bind=SUPER,s,spawn,~/.config/mango/snip.sh

      # exit
      bind=SUPER,m,quit
      bind=SUPER,q,killclient,
      
      # switch window focus
      bind=SUPER,Tab,focusstack,next
      bind=SUPER,Left,focusdir,left
      bind=SUPER,Right,focusdir,right
      bind=SUPER,Up,focusdir,up
      bind=SUPER,Down,focusdir,down
      
      # swap window
      bind=SUPER+SHIFT,Up,exchange_client,up
      bind=SUPER+SHIFT,Down,exchange_client,down
      bind=SUPER+SHIFT,Left,exchange_client,left
      bind=SUPER+SHIFT,Right,exchange_client,right
      
      # switch window status
      bind=SUPER+SHIFT,g,toggleglobal,
      bind=ALT,Tab,toggleoverview,
      bind=ALT,backslash,togglefloating,
      bind=ALT,a,togglemaximizescreen,
      bind=ALT,f,togglefullscreen,
      bind=ALT+SHIFT,f,togglefakefullscreen,
      bind=ALT,i,minimized,
      # bind=SUPER,o,toggleoverlay, # This has no documentation?
      bind=ALT+SHIFT,I,restore_minimized
      bind=ALT,d,toggle_scratchpad
      
      # scroller layout
      bind=ALT,e,set_proportion,1.0
      bind=ALT,x,switch_proportion_preset,
      
      # switch layout
      bind=SUPER,n,switch_layout
      
      # tag switch
      bind=ALT,Left,viewtoleft,0
      bind=CTRL,Left,viewtoleft_have_client,0
      bind=ALT,Right,viewtoright,0
      bind=CTRL,Right,viewtoright_have_client,0
      bind=CTRL+ALT,Left,tagtoleft,0
      bind=CTRL+ALT,Right,tagtoright,0
      
      bind=CTRL,1,view,1,0
      bind=CTRL,2,view,2,0
      bind=CTRL,3,view,3,0
      bind=CTRL,4,view,4,0
      bind=CTRL,5,view,5,0
      bind=CTRL,6,view,6,0
      bind=CTRL,7,view,7,0
      bind=CTRL,8,view,8,0
      bind=CTRL,9,view,9,0
      
      # tag: move client to the tag and focus it
      # tagsilent: move client to the tag and not focus it
      # bind=Alt,1,tagsilent,1
      bind=ALT,1,tag,1,0
      bind=ALT,2,tag,2,0
      bind=ALT,3,tag,3,0
      bind=ALT,4,tag,4,0
      bind=ALT,5,tag,5,0
      bind=ALT,6,tag,6,0
      bind=ALT,7,tag,7,0
      bind=ALT,8,tag,8,0
      bind=ALT,9,tag,9,0
      
      # monitor switch
      bind=CTRL+SUPER,Left,focusmon,left
      bind=CTRL+SUPER,Right,focusmon,right
      bind=SUPER+ALT,Left,tagmon,left
      bind=SUPER+ALT,Right,tagmon,right
      
      # gaps
      bind=ALT+SHIFT,X,incgaps,1
      bind=ALT+SHIFT,Z,incgaps,-1
      bind=ALT+SHIFT,R,togglegaps
      
      # movewin
      bind=CTRL+SHIFT,Up,movewin,+0,-50
      bind=CTRL+SHIFT,Down,movewin,+0,+50
      bind=CTRL+SHIFT,Left,movewin,-50,+0
      bind=CTRL+SHIFT,Right,movewin,+50,+0
      
      # resizewin
      bind=CTRL+ALT,k,resizewin,+0,-50
      bind=CTRL+ALT,j,resizewin,+0,+50
      bind=CTRL+ALT,h,resizewin,-50,+0
      bind=CTRL+ALT,l,resizewin,+50,+0
      
      # Mouse Button Bindings
      # NONE mode key only work in ov mode
      mousebind=SUPER,btn_left,moveresize,curmove
      #mousebind=NONE,btn_middle,togglemaximizescreen,0
      mousebind=SUPER,btn_right,moveresize,curresize
      mousebind=NONE,btn_left,toggleoverview,1
      mousebind=NONE,btn_right,killclient,0
      
      # Axis Bindings
      axisbind=ALT,UP,viewtoleft_have_client
      axisbind=ALT,DOWN,viewtoright_have_client
      
      # layer rule
      layerrule=animation_type_open:zoom,layer_name:rofi
      layerrule=animation_type_close:zoom,layer_name:rofi

      ##
      ## OTHER
      ##

      # Monitors
      monitorrule=DP-1,0.55,1,scroller,0,1,0,0,2560,1440,60
      monitorrule=HDMI-A-1,0.55,1,center_tile,0,1.5,2560,0,3480,2160,60
      exchange_cross_monitor=1
      scratchpad_cross_monitor=1
      single_scratchpad=1

      # System & Hardware
      adaptive_sync=1

      # Window effect
      blur=0
      blur_layer=0
      blur_optimized=1
      blur_params_num_passes = 2
      blur_params_radius = 5
      blur_params_noise = 0.02
      blur_params_brightness = 0.9
      blur_params_contrast = 0.9
      blur_params_saturation = 1.2
      
      shadows = 1
      layer_shadows = 0
      shadow_only_floating = 1
      shadows_size = 10
      shadows_blur = 15
      shadows_position_x = 0
      shadows_position_y = 0
      shadowscolor= 0x000000ff

      border_radius=6
      no_radius_when_single=1
      focused_opacity=1.0
      unfocused_opacity=0.97
      
      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 0-horizontal,1-vertical
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      tag_animation_direction=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=300
      animation_duration_open=200
      animation_duration_tag=250
      animation_duration_close=300
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1
      animation_curve_opafadeout=0.5,0.5,0.5,0.5
      animation_curve_opafadein=0.46,1.0,0.29,1
      
      # Scroller Layout Setting
      scroller_structs=20
      scroller_default_proportion=0.7
      scroller_focus_center=1
      scroller_prefer_center=0
      edge_scroller_pointer_focus=1
      scroller_default_proportion_single=1.0
      scroller_proportion_preset=0.5,0.8,1.0
      
      # Master-Stack Layout Setting
      new_is_master=0
      default_mfact=0.50
      default_nmaster=1
      smartgaps=0
      
      # Overview Setting
      hotarea_size=10
      enable_hotarea=0
      ov_tab_mode=1
      overviewgappi=5
      overviewgappo=30

      # Focus & Input
      focus_on_activate=1
      sloppyfocus=1
      focus_cross_tag=0
      focus_cross_monitor=1
      warpcursor=1
      cursor_hide_timeout=10
      cursor_theme=Bibata-Modern-Ice
      cursor_size=24
      drag_tile_to_tile=1
      axis_bind_apply_timeout=100
      axis_scroll_factor=1.0
      view_current_to_back=1

      # Window Behavior
      no_border_when_single=1
      idleinhibit_ignore_visible=0 #??
      inhibit_regardless_of_visibility=0 #??
      enable_floating_snap=0
      snap_distance=30
      
      # keyboard
      repeat_rate=40
      repeat_delay=400
      numlockon=0
      xkb_rules_layout=us

      # Appearance
      gappih=0
      gappiv=0
      gappoh=0
      gappov=0
      scratchpad_width_ratio=0.8
      scratchpad_height_ratio=0.9
      borderpx=4
      rootcolor=0x1a110fff
      bordercolor=0x58423cff
      focuscolor=0xe9c258ff
      maximizescreencolor=0x89aa61ff
      urgentcolor=0xe67e80ff
      scratchpadcolor=0xf1dfdbff
      globalcolor=0xffb4a3ff
      overlaycolor=0xd3c6aaff
      
      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule=id:1,monitor_name:DP-1,layout_name:scroller
      tagrule=id:2,monitor_name:HDMI-A-1,layout_name:center_tile
      tagrule=id:3,layout_name:tile
      tagrule=id:4,layout_name:tile
      tagrule=id:5,layout_name:tile
      tagrule=id:6,layout_name:tile
      tagrule=id:7,layout_name:tile
      tagrule=id:8,layout_name:tile
      tagrule=id:9,layout_name:tile

      # Named Scratchpads
      windowrule=isnamedscratchpad:1,width:1440,height:960,appid:discord
      windowrule=isnamedscratchpad:1,width:1440,height:960,appid:foot-yazi

      # Autostart
      exec-once=~/.config/mango/autostart.sh
    '';
    autostart_sh = ''
      # see autostart.sh
      # Note: here no need to add shebang

      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      # The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
      /usr/lib/xdg-desktop-portal-wlr &

      # Clipboard manager
      wl-clip-persist --clipboard regular --reconnect-tries 0 &
      # Watch clipboard and store history
      wl-paste --type text --watch cliphist store &

      firefox &
      foot &
      #quickshell &
      noctalia-shell &
    '';
  };

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
