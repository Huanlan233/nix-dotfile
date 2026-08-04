{ lib, ... }:
{
    imports = [
        ./input-methods/fcitx5.nix
        ./input-methods/ibus.nix
    ];

    options.settings.nixos.desktop.inputMethod = {
        enable = lib.mkEnableOption "Input method framework";

        type = lib.mkOption {
            type = lib.types.enum [ "fcitx5" "ibus" ];
            default = "fcitx5";
            description = "Input method framework type.";
        };
    };
}
