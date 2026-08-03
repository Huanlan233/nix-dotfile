{ config, lib, ... }:

let
  cfg = config.settings.nixos.system.nix;
in
{
  options.settings.nixos.system.nix = {
    enable = lib.mkEnableOption "Nix daemon settings";

    experimentalFeatures = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "nix-command" "flakes" ];
      description = "Nix experimental features.";
    };
  };

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = cfg.experimentalFeatures;
  };
}
