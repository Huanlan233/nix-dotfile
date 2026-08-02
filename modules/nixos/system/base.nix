{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  system.stateVersion = "26.05";
}
