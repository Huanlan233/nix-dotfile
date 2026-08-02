{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./apps.nix
    ./programs/git.nix
    ./programs/fcitx5.nix
    ../../../modules/home/editors/nixvim.nix
  ];
}
