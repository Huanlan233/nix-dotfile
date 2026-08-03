{ config, lib, ... }:

let
  cfg = config.settings.nixos.system.base;
in
{
  options.settings.nixos.system.base = {
    enable = lib.mkEnableOption "base system defaults";
    allowUnfree = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Allow unfree packages in nixpkgs.";
    };
    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "26.05";
      description = "NixOS state version.";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = cfg.allowUnfree;

    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    system.stateVersion = cfg.stateVersion;
  };
}
