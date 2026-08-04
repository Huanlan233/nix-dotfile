{ config, lib, pkgs, ... }:

let
    inputMethod = config.settings.nixos.desktop.inputMethod;
    ibus = inputMethod.ibus;
in
{
    options.settings.nixos.desktop.inputMethod.ibus = {
        engines = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs.ibus-engines; [ libpinyin ];
            description = "IBus engines to enable.";
        };

        waylandFrontend = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Use the Wayland input method frontend.";
        };
    };

    config = lib.mkIf (inputMethod.enable && inputMethod.type == "ibus") {
        i18n.inputMethod = {
            enable = true;
            type = "ibus";
            ibus = {
                inherit (ibus) engines;
                waylandFrontend = ibus.waylandFrontend;
            };
        };
    };
}
