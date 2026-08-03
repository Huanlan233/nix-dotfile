{ config, lib, ... }:

let
  cfg = config.settings.nixos.desktop.shell;
in
{
  options.settings.nixos.desktop.shell = {
    enable = lib.mkEnableOption "Shell";

    type = lib.mkOption {
      type = lib.types.str;
      default = "dms";
      description = "Shell flavour";
    };
  };
}
