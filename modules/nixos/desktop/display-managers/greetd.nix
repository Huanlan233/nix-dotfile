{ config, lib, ... }:

let
  displayManager = config.settings.nixos.desktop.displayManager;
in
{
  config = lib.mkIf (displayManager.enable && displayManager.type == "greetd") {
    services.greetd.enable = true;
  };
}
