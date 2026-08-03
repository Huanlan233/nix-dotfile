{ config, lib, inputs, ... }:

let
  cfg = config.settings.nixos.desktop.niri;
in
{
  options.settings.nixos.desktop.niri.enable =
    lib.mkEnableOption "niri compositor";

  imports = [
    inputs.niri.nixosModules.niri
  ];

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
