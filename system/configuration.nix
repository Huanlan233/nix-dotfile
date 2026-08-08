{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./environment/default.nix
    ./hardware/default.nix
    ./i18n/default.nix
    ./networking/default.nix
    ./programs/default.nix
    ./services/default.nix
    ./time/default.nix
    ./users/default.nix
    ./xdg/default.nix
    ./fonts/default.nix
  ];

  system = {
    stateVersion = "26.05";
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = import ./overlays;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
