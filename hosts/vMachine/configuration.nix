{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/configuration.nix
  ];

  settings.nixos = {
    system.base = {
      enable = true;
      stateVersion = "26.05";
    };

    system.locale = {
      enable = true;
      timeZone = "Asia/Shanghai";
      defaultLocale = "zh_CN.UTF-8";
    };

    system.network = {
      enable = true;
      hostName = "huan";
      wireless = true;
      networkmanager = true;
      firewall = true;
    };

    system.nix.enable = true;
    system.users.enable = true;

    hardware.bluetooth.enable = true;

    desktop.displayManager = {
      enable = true;
      command = "niri-session";
    };

    desktop.niri.enable = true;
    desktop.inputMethod.enable = true;

    services.homeManager.enable = true;
    services.agenix.enable = true;
    services.noctalia.enable = true;
  };

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      fsIdentifier = "provided";
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
