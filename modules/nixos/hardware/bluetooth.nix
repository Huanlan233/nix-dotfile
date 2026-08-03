{ config, lib, ... }:

let
  cfg = config.settings.nixos.hardware.bluetooth;
in
{
  options.settings.nixos.hardware.bluetooth.enable =
    lib.mkEnableOption "Bluetooth support";

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
  };
}
