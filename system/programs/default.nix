{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.nixvim.nixosModules.nixvim
  ];

  programs = {
    niri = {
      enable = true;
    };

    noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd.enable = true;
    };

    nixvim = {
      enable = true;
      defaultEditor = true;
      nixpkgs.source = inputs.nixpkgs;
      opts = {
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        smartindent = true;
      };
    };
  };
}
