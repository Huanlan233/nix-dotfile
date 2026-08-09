{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./programs/default.nix
  ];

  home.username = "huan";
  home.homeDirectory = "/home/huan";

  home.packages = with pkgs; [
    clash-verge-rev
    cc-switch
    inputs.codex-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

}
