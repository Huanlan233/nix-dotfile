{ config, lib, ... }:

let
    cfg = config.settings.nixos.system.nix;
in
{
    options.settings.nixos.system.nix = {
        enable = lib.mkEnableOption "Nix daemon settings";
        allowUnfree.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Allow unfree packages in nixpkgs.";
        };

        experimentalFeatures = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Nix experimental features.";
        };
    };

    config = lib.mkIf cfg.enable {
        nixpkgs.config.allowUnfree = cfg.allowUnfree.enable;
        nix.settings.experimental-features = [ "nix-command" "flakes" ] ++ cfg.experimentalFeatures;
    };
}
