{ config, lib, ... }:

let
    compositor = config.settings.nixos.desktop.compositor;
    greeter = config.settings.nixos.desktop.greeter;
in
{
    config = lib.mkIf (greeter.enable && greeter.type == "dankgreeter") {
        services.greetd.useTextGreeter = false;
        services.displayManager.dms-greeter = {
            enable = true;
            compositor.name = compositor.type;
        };
    };
}
