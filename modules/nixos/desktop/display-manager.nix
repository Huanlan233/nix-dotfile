{ config, lib, pkgs, ... }:

let
  cfg = config.settings.nixos.desktop.displayManager;
in
{
  options.settings.nixos.desktop.displayManager = {
    enable = lib.mkEnableOption "Display Manager.";
    greetd.enable = lib.mkEnableOption "Greetd";
    greetd.command = lib.mkOption {
      type = lib.types.str;
      default = "niri-session";
      description = "Session command launched by the greeter.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = lib.mkIf cfg.greetd.enable {
      enable = true;
      settings.default_session = {
        user = "greeter";
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${cfg.greetd.command} --asterisks";
      };
    };
  };
}
