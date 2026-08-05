{ config, lib, pkgs, ... }:

let
    compositor = config.settings.nixos.desktop.compositor;
    greeter = config.settings.nixos.desktop.greeter;
in
{
    config = lib.mkIf (greeter.enable && greeter.type == "tuigreet") {
        services.greetd = {
            useTextGreeter = false;
            settings.default_session.command = "${lib.getExe pkgs.tuigreet} --asterisks";
        };
    };
}
