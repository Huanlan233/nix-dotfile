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
  };
}
