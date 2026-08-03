{ config, lib, pkgs, ... }:

let
  cfg = config.settings.nixos.desktop.displayManager;
in
{
  options.settings.nixos.desktop.displayManager = {
    enable = lib.mkEnableOption "greetd display manager";

    command = lib.mkOption {
      type = lib.types.str;
      default = "niri-session";
      description = "Session command launched by the greeter.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings.default_session = {
        user = "greeter";
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${cfg.command} --asterisks";
      };
    };
  };
}
