{ config, lib, ... }:

let
  cfg = config.settings.nixos.system.version;
in
{
  options.settings.nixos.system.version = {
    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "26.05";
      description = "NixOS state version.";
    };
  };

  config = {
    system.stateVersion = cfg.stateVersion;
  };
}
