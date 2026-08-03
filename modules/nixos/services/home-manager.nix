{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.settings.nixos.services.homeManager;

  # Normal NixOS users are managed by Home Manager automatically.
  userNames = lib.filter
    (name: config.users.users.${name}.isNormalUser or false)
    (lib.attrNames config.users.users);

  homeModuleFor = name: {
    # Optional per-user config: homes/<name>/default.nix.
    imports = lib.optional
      (builtins.pathExists ../../../homes/${name}/default.nix)
      ../../../homes/${name}/default.nix;
  };
in
{
  options.settings.nixos.services.homeManager.enable =
    lib.mkEnableOption "Home Manager user profiles";

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  config = lib.mkIf cfg.enable {
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = false;

      sharedModules = [
        ../../../homes/shared/home.nix
      ];

      users = lib.genAttrs userNames homeModuleFor;
    };
  };
}
