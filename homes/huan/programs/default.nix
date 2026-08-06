{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./fcitx5.nix
    ./git.nix
    ./gtk.nix
    ./niri.nix
    ./noctalia.nix
    ./nixvim.nix
  ];
}
