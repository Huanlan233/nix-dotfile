{
  pkgs,
  lib,
  ...
}:

{
  services = {
    greetd = {
      enable = true;
      useTextGreeter = false;
      settings.default_session.command = "${lib.getExe pkgs.tuigreet} --asterisks";
    };

    gvfs = {
      enable = true;
    };

    udisks2 = {
      enable = true;
    };

    dbus = {
      enable = true;
    };

    xserver = {
      updateDbusEnvironment = true;
    };
  };
}
