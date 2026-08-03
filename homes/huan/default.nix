{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./apps.nix
    ./programs/git.nix
    ./programs/fcitx5.nix
    ../../modules/home/default.nix
  ];

  settings.home.editors.nixvim.enable = true;
}
