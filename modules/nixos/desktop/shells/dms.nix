{ config, lib, inputs, pkgs, ... }:

let
  shell = config.settings.nixos.desktop.shell;

  patchedDms = pkgs.dms-shell.overrideAttrs (old:
    let
      patchedSrc = pkgs.applyPatches {
        name = "dms-shell-systemtray-icon";
        src = old.src;
        patches = [ ../../../../patches/dms-systemtray-icon-resolution.patch ];
      };
    in
    {
      src = patchedSrc;
      sourceRoot = "${patchedSrc.name}/core";
      postInstall = builtins.replaceStrings [
        old.src.outPath
      ] [
        patchedSrc.outPath
      ] old.postInstall;
    });
in
{
  imports = [
    inputs.dms.nixosModules.dank-material-shell
  ];

  config = lib.mkIf (shell.enable && shell.type == "dms") {
    programs.dms-shell = {
      enable = true;
      package = patchedDms;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      enableVPN = true;
      enableSystemMonitoring = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
    };
  };
}
