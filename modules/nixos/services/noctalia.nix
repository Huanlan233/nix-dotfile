{ config, lib, pkgs, inputs, ... }:

{
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
  };
}
