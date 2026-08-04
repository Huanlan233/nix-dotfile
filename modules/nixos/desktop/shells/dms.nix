{ config, lib, inputs, ... }:

let
  shell = config.settings.nixos.desktop.shell;
in
{
  imports = [
    inputs.dms.nixosModules.dank-material-shell
  ];

  config = lib.mkIf (shell.enable && shell.type == "dms") {
    programs.dms-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      enableVPN = true;
      enableSystemMonitoring = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
    };
  };
}
