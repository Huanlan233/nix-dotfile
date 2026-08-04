{ config, lib, pkgs, ... }:

let
  inputMethod = config.settings.nixos.desktop.inputMethod;
  fcitx5 = inputMethod.fcitx5;
in
{
  options.settings.nixos.desktop.inputMethod.fcitx5.waylandFrontend = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Use the Fcitx5 Wayland frontend instead of GTK/QT IM modules.";
  };

  config = lib.mkIf (inputMethod.enable && inputMethod.type == "fcitx5") {
    environment.systemPackages = [
      pkgs.adwaita-icon-theme
    ];

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-gtk
          qt6Packages.fcitx5-configtool
        ];
        waylandFrontend = fcitx5.waylandFrontend;
      };
    };
  };
}
