{ pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];

      config.common.default = [
        "gnome"
        "gtk"
      ];

      xdgOpenUsePortal = true;
    };

    terminal-exec = {
      enable = true;
      settings.default = [
        "Alacritty.desktop"
      ];
    };
  };
}
