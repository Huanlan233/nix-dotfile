{ lib, ... }:
{
  imports = [
    ./shells/dms.nix
    ./shells/noctalia.nix
  ];

  options.settings.nixos.desktop.shell = {
    enable = lib.mkEnableOption "Shell";

    type = lib.mkOption {
      type = lib.types.enum [ "dms" "noctalia" ];
      default = "dms";
      description = "Shell flavour";
    };
  };
}
