{ config, lib, ... }:

let
  cfg = config.settings.nixos.system.network;
in
{
  options.settings.nixos.system.network = {
    enable = lib.mkEnableOption "network and firewall settings";

    hostName = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = "Network host name. The host can still override it directly.";
    };

    wireless = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable wpa_supplicant wireless support.";
    };

    networkmanager = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable NetworkManager.";
    };

    firewall = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the NixOS firewall.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking = {
      hostName = lib.mkDefault cfg.hostName;
      wireless.enable = cfg.wireless;
      networkmanager.enable = cfg.networkmanager;
      firewall.enable = cfg.firewall;
    };
  };
}
