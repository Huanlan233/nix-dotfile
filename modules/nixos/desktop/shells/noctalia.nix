{ config, lib, ... }:

let
    shell = config.settings.nixos.desktop.shell;
in
{
    config = lib.mkIf (shell.enable && shell.type == "noctalia") {
        programs.noctalia = {
            enable = true;
            recommendedServices.enable = true;
            systemd.enable = true;
        };
    };
}
