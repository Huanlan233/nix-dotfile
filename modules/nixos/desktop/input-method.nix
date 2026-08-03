{ config, lib, pkgs, ... }:

let
  cfg = config.settings.nixos.desktop.inputMethod;
in
{
  options.settings.nixos.desktop.inputMethod = {
    enable = lib.mkEnableOption "fcitx5 input method";

    type = lib.mkOption {
      type = lib.types.str;
      default = "fcitx5";
      description = "Input method framework type.";
    };
  };

  config = lib.mkIf cfg.enable {
    i18n.inputMethod = {
      enable = true;
      type = cfg.type;
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        qt6Packages.fcitx5-configtool
      ];
    };

    environment.sessionVariables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
    };
  };
}
