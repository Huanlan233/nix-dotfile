{ config, lib, pkgs, inputs, ... }:

let
  # Normal NixOS users are managed by Home Manager automatically.
  userNames = lib.filter
    (name: config.users.users.${name}.isNormalUser or false)
    (lib.attrNames config.users.users);

  homeModuleFor = name: {
    # Optional per-user config: homes/users/<name>/default.nix.
    imports = lib.optional
      (builtins.pathExists ../../../homes/users/${name}/default.nix)
      ../../../homes/users/${name}/default.nix;
  };
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = false;

    sharedModules = [
      ../../../homes/shared/home.nix
    ];

    users = lib.genAttrs userNames homeModuleFor;
  };
}
