{ config, lib, inputs, ... }:

let
    compositor = config.settings.nixos.desktop.compositor;
    greeter = config.settings.nixos.desktop.greeter;
in
{
    imports = [
        inputs.noctlia-greeter.nixosModules.default
    ];
    config = lib.mkIf (greeter.enable && greeter.type == "noctalia-greeter") {
        programs.noctalia-greeter = {
            enable = true;
            settings = {
                keyboard.layout = "us";
            };
        };
    }
}
