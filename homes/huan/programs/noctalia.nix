{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    settings = {
      bar = {
        "default" = {
          position = "bottom";
          end = [
            "media"
            "wallpaper"
            "tray"
            "notifications"
            "clipboard"
            "network"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
          ];
          start = [
            "session"
            "control-center"
            "launcher"
            "workspaces"
          ];
        };
      };

      calendar = {
        enabled = true;
      };

      control_center = {
        sidebar = "full";
        sidebar_section = "full";

        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "dark_mode"; }
          { type = "notification"; }
          { type = "power_profile"; }
          { type = "caffeine"; }
        ];
      };

      dock = {
        auto_hide = true;
        enabled = true;
        launcher_position = "start";
        layer = "overlay";
        position = "right";
        show_dots = true;
        reserve_space = false;
      };

      location = {
        auto_locate = true;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
      };

      shell = {
        external_ip_enabled = true;
        password_style = "random";
        screen_time_enabled = true;
        telemetry_enabled = true;

        greeter_sync = {
          auto_sync = false;
        };

        launcher = {
          app_grid = true;
        };

        panel = {
          clipboard_position = "auto";
          control_center_placement = "floating";
          launcher_position = "auto";
          open_near_click_clipboard = true;
          open_near_click_control_center = true;
          open_near_click_launcher = true;
          open_near_click_session = true;
          open_near_click_wallpaper = true;
          session_placement = "floating";
          wallpaper_placement = "floating";
        };
      };

      theme = {
        builtin = "Noctalia";
        community_palette = "Oxocarbon";
        mode = "auto";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";

        templates = {
          builtin_ids = [
            "alacritty"
            "gtk3"
            "gtk4"
            "kcolorscheme"
            "niri"
            "qt"
          ];
          community_ids = [
            "feishin"
            "discord"
            "telegram"
            "vscode"
            "steam"
            "obs"
          ];
        };
      };
    };
  };
}
