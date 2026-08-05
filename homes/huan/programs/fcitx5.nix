{
  config,
  lib,
  pkgs,
  ...
}:

{
  i18n.inputMethod.fcitx5.settings = {
    inputMethod = {
      GroupOrder = [ "Default" ];
      "Groups/Default" = {
        Name = "Default";
        DefaultLayout = "us";
        DefaultIM = "rime";
      };

      "Groups/Default/Items" = [
        { Name = "keyboard-us"; }
        { Name = "rime"; }
      ];
    };
  };
}
