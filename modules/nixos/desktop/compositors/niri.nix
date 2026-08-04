{ config, lib, inputs, ... }:

let
  compositor = config.settings.nixos.desktop.compositor;
in
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  config = lib.mkIf (compositor.enable && compositor.type == "niri") {
    programs.niri.enable = true;
    settings.nixos.desktop.compositor.sessionCommand = "niri-session";
  };
}
