{ config, lib, pkgs, inputs, ... }:

let
    cfg = config.settings.nixos.services.agenix;
in
{
    options.settings.nixos.services.agenix = {
        enable = lib.mkEnableOption "agenix secrets";

        cliPackage = lib.mkOption {
            type = lib.types.package;
            default = pkgs.agenix-cli;
            description = "agenix CLI package.";
        };
      };

      imports = [
          inputs.agenix.nixosModules.default
      ];

      config = lib.mkIf cfg.enable {
          environment.systemPackages = [
              cfg.cliPackage
          ];
    };
}
