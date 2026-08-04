{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];
    programs.dank-material-shell.enable = true;
    programs.dank-material-shell.settings = {
        showDock = true;
        dockAutoHide = true;
        dockSmartAutoHide = true;
        dockOpenOnOverview = true;
        dockLauncherEnable = true;
        dockPosition = 3;
        barConfigs = [
            {
                "id" = "default";
                "name" = "Main Bar";
                "enabled" = true;
                "position" = 1;
                "screenPreferences" = [
                    "all"
                ];
                "showOnLastDisplay" = true;
                "leftWidgets" = [
                    "launcherButton"
                    "controlCenterButton"
                    "workspaceSwitcher"
                    "focusedWindow"
                ];
                "centerWidgets" = [
                    "music"
                    "clock"
                    "weather"
                ];
                "rightWidgets" = [
                    "systemTray"
                    "clipboard"
                    "cpuUsage"
                    "memUsage"
                    "notificationButton"
                    "battery"
                ];
                "spacing" = 4;
                "innerPadding" = 4;
                "barInsetPadding" = 4;
                "bottomGap" = 0;
                "transparency" = 1;
                "widgetTransparency" = 1;
                "squareCorners" = false;
                "noBackground" = false;
                "maximizeWidgetIcons" = false;
                "maximizeWidgetText" = false;
                "removeWidgetPadding" = false;
                "widgetPadding" = 8;
                "gothCornersEnabled" = false;
                "gothCornerRadiusOverride" = false;
                "gothCornerRadiusValue" = 12;
                "borderEnabled" = false;
                "borderColor" = "surfaceText";
                "borderOpacity" = 1;
                "borderThickness" = 1;
                "widgetOutlineEnabled" = false;
                "widgetOutlineColor" = "surfaceText";
                "widgetOutlineOpacity" = 1;
                "widgetOutlineThickness" = 1;
                "fontScale" = 1;
                "iconScale" = 1;
                "autoHide" = false;
                "autoHideStrict" = false;
                "autoHideDelay" = 250;
                "showOnWindowsOpen" = false;
                "openOnOverview" = false;
                "visible" = true;
                "popupGapsAuto" = true;
                "popupGapsManual" = 4;
                "maximizeDetection" = true;
                "useOverlayLayer" = false;
                "scrollEnabled" = true;
                "scrollXBehavior" = "column";
                "scrollYBehavior" = "workspace";
                "shadowIntensity" = 0;
                "shadowOpacity" = 60;
                "shadowColorMode" = "default";
                "shadowCustomColor" = "#000000";
                "clickThrough" = false;
                "hoverPopouts" = false;
                "hoverPopoutDelay" = 150;
            }
        ];
    };
}