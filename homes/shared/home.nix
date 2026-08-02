{ config, lib, pkgs, ... }:

{
  home.stateVersion = lib.mkDefault "26.05";

  home.packages = with pkgs; [
    wget
    git
  ];
}
