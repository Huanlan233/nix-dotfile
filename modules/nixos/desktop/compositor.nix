{ lib, ... }:
{
    imports = [
        ./compositors/niri.nix
    ];

    options.settings.nixos.desktop.compositor = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Compositor";
        };

        type = lib.mkOption {
            type = lib.types.enum [ "niri" ];
            default = "niri";
            description = "Compositor flavour";
        };
    };
}
