{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
    };
  };
}
