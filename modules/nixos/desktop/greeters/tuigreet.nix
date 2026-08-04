{ config, lib, pkgs, ... }:

let
  compositor = config.settings.nixos.desktop.compositor;
  greeter = config.settings.nixos.desktop.greeter;
in
{
  config = lib.mkIf (greeter.enable && greeter.type == "tuigreet") {
    services.greetd = {
      useTextGreeter = true;
      settings.default_session.command =
        "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${lib.escapeShellArg compositor.sessionCommand} --asterisks";
    };

    assertions = [
      {
        assertion = compositor.enable && compositor.sessionCommand != "";
        message = "TUIGreet requires an enabled compositor with a session command.";
      }
    ];
  };
}
