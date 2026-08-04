{ lib, ... }:
{
  imports = [
    ./greeters/tuigreet.nix
    ./greeters/dankgreeter.nix
  ];

  options.settings.nixos.desktop.greeter = {
    enable = lib.mkEnableOption "Greeter";

    type = lib.mkOption {
      type = lib.types.enum [ "tuigreet" "dankgreeter" ];
      default = "tuigreet";
      description = "Greeter flavour";
    };
  };
}
