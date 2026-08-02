{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  environment.systemPackages = [
    pkgs.agenix-cli
  ];
}
