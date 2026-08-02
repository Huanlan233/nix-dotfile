{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./users.nix

    ../../modules/nixos/system/base.nix
    ../../modules/nixos/system/locale.nix
    ../../modules/nixos/system/network.nix
    ../../modules/nixos/system/nix.nix

    ../../modules/nixos/hardware/bluetooth.nix

    ../../modules/nixos/desktop/display-manager.nix
    ../../modules/nixos/desktop/niri.nix
    ../../modules/nixos/desktop/input-method.nix

    ../../modules/nixos/services/home-manager.nix
    ../../modules/nixos/services/agenix.nix
    ../../modules/nixos/services/noctalia.nix
  ];
}
