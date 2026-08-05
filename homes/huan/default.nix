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
    firefox
    vscode
    clash-verge-rev
    alacritty

    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras

    mcp-nixos
    cc-switch
    inputs.codex-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

}
