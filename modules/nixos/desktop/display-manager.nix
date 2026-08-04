{ lib, ... }:
{
  imports = [
    ./display-managers/greetd.nix
  ];

  options.settings.nixos.desktop.displayManager = {
    enable = lib.mkEnableOption "Display manager";

    type = lib.mkOption {
      type = lib.types.enum [ "greetd" ];
      default = "greetd";
      description = "Display manager backend.";
    };
  };
}
