{ config, pkgs, inputs, ... }:

{
    programs.niri.settings = {
        input = {
            keyboard = {
                xkb.layout = "us";
                numlock = true;
            };
        };

        layout = {
            focus-ring = {
                width = 2;
            };
        };

        # outputs = {
        #     "Virtual-1" = { # This is for vMachine
        #         scale = 1;
        #         mode = {
        #             width = 1920;
        #             height = 1080;
        #         };
        #     };
        # };
        
        prefer-no-csd = true;
        
        binds = {
            "Mod+Return".action.spawn-sh = "noctalia msg panel-open launcher";
            "Mod+T".action.spawn = "alacritty";

            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;

            "Mod+Home".action.focus-column-first = [];
            "Mod+End".action.focus-column-last = [];

            "Mod+Up".action.focus-window-up = [];
            "Mod+Down".action.focus-window-down = [];
            "Mod+Right".action.focus-column-right = [];
            "Mod+Left".action.focus-column-left = [];

            "Mod+Page_Up".action.focus-workspace-up = [];
            "Mod+Page_Down".action.focus-workspace-down = [];

            "Mod+WheelScrollUp" = {
                cooldown-ms=150;
                action.focus-workspace-up = [];
            };
            "Mod+WheelScrollDown" = {
                cooldown-ms=150;
                action.focus-workspace-down = [];
            };
            "Mod+WheelScrollRight" = {
                cooldown-ms=150;
                action.focus-column-right = [];
            };
            "Mod+WheelScrollLeft" = {
                cooldown-ms=150;
                action.focus-column-left = [];
            };

            "Mod+Q".action.close-window = [];
            "Mod+F".action.maximize-column = [];
            "Mod+Shift+F".action.fullscreen-window = [];
            "Mod+O".action.toggle-overview = [];

            "Mod+R".action.switch-preset-column-width = [];
            "Mod+Shift+R".action.switch-preset-window-height = [];
            "Mod+Ctrl+R".action.reset-window-height = [];

            "Mod+C".action.center-column = [];
            "Mod+Shift+C".action.center-visible-columns = [];

            "Mod+Equal".action.set-column-width = "+10%";
            "Mod+Minus".action.set-column-width = "-10%";
            "Mod+Shift+Equal".action.set-window-height = "+10%";
            "Mod+Shift+Minus".action.set-window-height = "-10%";

            "Mod+V".action.toggle-window-floating = [];
            "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];

            "Mod+W".action.toggle-column-tabbed-display = [];

            "Print".action.screenshot = [];
            "Ctrl+Print".action.screenshot-screen = [];
            "Alt+Print".action.screenshot-window = [];

            # Control Window & Column
            "Mod+BracketLeft".action.consume-or-expel-window-left = [];
            "Mod+BracketRight".action.consume-or-expel-window-right = [];

            "Mod+Ctrl+1".action.move-column-to-workspace = 1;
            "Mod+Ctrl+2".action.move-column-to-workspace = 2;
            "Mod+Ctrl+3".action.move-column-to-workspace = 3;
            "Mod+Ctrl+4".action.move-column-to-workspace = 4;
            "Mod+Ctrl+5".action.move-column-to-workspace = 5;
            "Mod+Ctrl+6".action.move-column-to-workspace = 6;
            "Mod+Ctrl+7".action.move-column-to-workspace = 7;
            "Mod+Ctrl+8".action.move-column-to-workspace = 8;
            "Mod+Ctrl+9".action.move-column-to-workspace = 9;

            "Mod+Ctrl+Home".action.move-column-to-first = [];
            "Mod+Ctrl+End".action.move-column-to-last = [];

            "Mod+Ctrl+Up".action.move-window-up = [];
            "Mod+Ctrl+Down".action.move-window-down = [];
            "Mod+Ctrl+Right".action.move-column-right = [];
            "Mod+Ctrl+Left".action.move-column-left = [];

            "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [];
            "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [];

            "Mod+Ctrl+WheelScrollUp" = {
                cooldown-ms=150;
                action.move-column-to-workspace-up = [];
            };
            "Mod+Ctrl+WheelScrollDown" = {
                cooldown-ms=150;
                action.move-column-to-workspace-down = [];
            };
            "Mod+Ctrl+WheelScrollRight" = {
                cooldown-ms=150;
                action.move-column-right = [];
            };
            "Mod+Ctrl+WheelScrollLeft" = {
                cooldown-ms=150;
                action.move-column-left = [];
            };

            # Monitor
            "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
            "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
            "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
            "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];
            "Mod+Shift+P".action.power-off-monitors = [];
        };
    };
}