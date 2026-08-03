{ config, lib, inputs, ... }:

let
  cfg = config.settings.nixos.desktop.compositor;
in
{
  options.settings.nixos.desktop.compositor = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Compositor";
    };

    type = lib.mkOption {
      type = lib.types.str;
      default = "niri";
      description = "Compositor flavour";
    };
  };
}
