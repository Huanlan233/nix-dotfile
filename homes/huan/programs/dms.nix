{ lib, config, inputs, pkgs, ... }: 

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  programs = {
    dank-material-shell = {
      enable = true;

      settings = {
        currentThemeName = "dynamic";
        currentThemeCategory = "dynamic";
        matugenTemplateNeovim = true;
        dynamicTheming = true;
        showDock = true;
        dockAutoHide = true;
        dockPosition = 3;

  
      };
    };
  };
}
