{ config, lib, ... }:

let
  cfg = config.settings.nixos.services.noctalia;
in
{
  options.settings.nixos.services.noctalia = {
    enable = lib.mkEnableOption "noctalia services";

    recommendedServices = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable noctalia recommended services.";
    };

    systemd = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable noctalia systemd integration.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      enable = true;
      recommendedServices.enable = cfg.recommendedServices;
      systemd.enable = cfg.systemd;
    };
  };
}
