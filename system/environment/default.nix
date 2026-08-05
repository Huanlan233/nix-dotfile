{
  pkgs,
  ...
}:
{
  environment = {
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    variables = {

    };

    sessionVariables = {
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      XDG_DATA_DIRS = [
        "/run/current-systen/sw/share"
        "/run/current-system/sw/share/icons"
      ];
      QT_QUICK_CONTROL_ICON_THEME = "Adwaita";
    };

    systemPackages = with pkgs; [
      agenix-cli
      adwaita-icon-theme
      git
      wget
    ];
  };
}
